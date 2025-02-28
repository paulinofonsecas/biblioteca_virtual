import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/data/erros/duplicate_payment.dart';
import 'package:bilioteca_virtual/data/erros/valor_inferior.dart';
import 'package:bilioteca_virtual/data/erros/valor_superior.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/payment.dart';
import 'package:bilioteca_virtual/domain/use_cases/payment_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:verify_payment/models/response_model.dart';

part 'validar_compra_state.dart';

class ValidarCompraCubit extends Cubit<ValidarCompraState> {
  ValidarCompraCubit() : super(ValidarCompraInitial()) {
    _paymentUseCases = getIt<IPaymentUseCases>();
  }

  late final IPaymentUseCases _paymentUseCases;

  Future<void> validarPagamento(
    BookModel book,
    VerifyPaymentSuccess? paymentValidator,
  ) async {
    emit(ValidarCompraPaymentLoading());
    try {
      if (paymentValidator != null) {
        final payment = Payment(
          id: const Uuid().v4(),
          bookId: book.id,
          amount: paymentValidator.dINHEIRO!.toDouble(),
          currency: 'Kz',
          date: _parseData(paymentValidator.dATA!),
          paymentMethod: 'Transferencia',
          transactionId: paymentValidator.tRANSACAO!.toString(),
        );

        emit(ValidarCompraPaymentSuccess(payment));
      }
    } catch (e) {
      emit(
        const ValidarCompraPaymentFailure(
          'Ocorreu um erro ao validar o comprovante, tente novamente!',
        ),
      );
    }
  }

  // ignore: inference_failure_on_untyped_parameter, prefer_void_to_null
  FutureOr<Null> _onPaymentFailure(error, stackTrace) {
    if (error is DuplicatePayment) {
      emit(
        const ValidarCompraPaymentFailure(
          'Este comprovativo já foi usado nesta plataforma!',
        ),
      );
    }

    if (error is PaymentInferior) {
      emit(
        const ValidarCompraPaymentFailure(
          'O valor pago é inferior ao preço do produto.',
        ),
      );
    }

    if (error is PaymentSuperior) {
      emit(
        const ValidarCompraPaymentFailure(
          'O valor pago é superior ao preço do produto.',
        ),
      );
    }
  }

  DateTime _parseData(DATA data) => DateTime(
        data.ano!,
        data.mes!,
        data.dia!,
        data.hora!,
        data.minuto!,
        data.segundo!,
      );

  void reset() {
    emit(ValidarCompraInitial());
  }
}
