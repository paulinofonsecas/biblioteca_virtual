import 'dart:io';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_lista_de_leitura_datasource.dart';
import 'package:bilioteca_virtual/data/erros/duplicate_payment.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/payment.dart';
import 'package:bilioteca_virtual/domain/use_cases/payment_use_cases.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/carregar_comprovante_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:verify_payment/models/response_model.dart';
import 'package:verify_payment/verify_payment.dart';

part 'validar_comprovativo_state.dart';

class ValidarComprovativoCubit extends Cubit<ValidarComprovativoState> {
  ValidarComprovativoCubit(this._listaDeLeituraDatasource)
      : super(ValidarComprovativoInitial());

  final IListaLeituraDatasource _listaDeLeituraDatasource;

  final paymentUC = getIt<IPaymentUseCases>();

  /// Valida o comprovativo de pagamento do livro.
  ///
  /// Verifica se o arquivo de comprovativo existe e se o valor pago e igual ou
  /// maior que o valor do livro. Caso o valor seja inferior, um erro e emitido.
  ///
  /// Se o comprovativo e valido, o pagamento e processado e o estado de sucesso
  /// e emitido.
  ///
  /// Caso haja algum erro durante a verificacao do comprovativo, um estado de
  /// erro e emitido.
  Future<void> validar(BookModel book) async {
    emit(ValidarComprovativoLoading());
    try {
      final comprovativoState = getIt<CarregarComprovanteCubit>().state;

      if (comprovativoState is! CarregarComprovanteLoaded) {
        const ValidarComprovativoError(
          message: 'Erro ao processar o comprovativo. Tente novamente',
        );
        return;
      }

      final comprovativoPath = comprovativoState.path;

      final file = File(comprovativoPath);
      final result = await verifyPayment(file);

      if (result is VerifyPaymentSuccess) {
        if (result.sTATUS == 423) {
          emit(
            const ValidarComprovativoError(
              message: 'O comprovativo não representa uma transferência',
            ),
          );
          return;
        }

        final montante = double.parse(
          result.mONTANTE!.replaceAll('.', '').replaceAll(',', '.'),
        );

        // verifica se o valor pago e igual ou maior que do livro?
        if (result.mONTANTE != null && montante < book.preco.valor) {
          emit(
            const ValidarComprovativoError(
              message: 'O valor pago e menor que o valor do livro,'
                  ' contate o administrador',
            ),
          );
          return;
        }

        // verifica se o iban e o nome de destino estao corretos?
        if (result.iBAN != kContaIban ||
            result.dESTINATARIO!.toLowerCase() != kContaNome.toLowerCase()) {
          emit(
            const ValidarComprovativoError(
              message: 'O comprovativo nao representa uma'
                  ' transferencia para o livro',
            ),
          );
          return;
        }

        await paymentUC.processPayment(
          Payment(
            id: const Uuid().v4(),
            bookId: book.id,
            amount: result.mONTANTE != null
                ? montante
                : result.dINHEIRO?.toDouble() ?? 0.0,
            currency: 'Kz',
            date: _parseData(result.dATA!),
            paymentMethod: 'Transferencia',
            transactionId: result.tRANSACAO!.toString(),
          ),
          book,
        );

        await _listaDeLeituraDatasource.addBook(book);

        emit(ValidarComprovativoSuccess(result: result));
      } else {
        emit(
          const ValidarComprovativoError(
            message: 'Erro ao validar o comprovativo',
          ),
        );
      }
    } on DuplicatePayment {
      emit(
        const ValidarComprovativoError(
          message: 'Comprovativo duplicado. Entre em contato com o suporte.',
        ),
      );
    } catch (e) {
      emit(
        const ValidarComprovativoError(
          message: 'Erro ao processar o pagamento.',
        ),
      );
    }
  }
}

DateTime _parseData(DATA data) {
  return DateTime(
    data.ano!,
    data.mes!,
    data.dia!,
    data.hora!,
    data.minuto!,
    data.segundo!,
  );
}
