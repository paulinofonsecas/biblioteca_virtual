import 'package:bilioteca_virtual/core/dependency/get_it.dart';
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

  Future<void> validarLivro(
    BookModel book,
    VerifyPaymentSuccess? paymentValidator,
  ) async {
    emit(ValidarCompraPaymentLoading());

    if (paymentValidator != null) {
      if (book.preco.valor == paymentValidator.dINHEIRO!.toDouble()) {
        final payment = Payment(
          id: const Uuid().v4(),
          bookId: book.id,
          amount: paymentValidator.dINHEIRO!.toDouble(),
          currency: 'Kz',
          date: DateTime.parse(paymentValidator.dATA!.data!),
          paymentMethod: 'Transferencia',
          transactionId: paymentValidator.tRANSACAO!.toString(),
        );

        await _paymentUseCases.processPayment(payment).then(
          (value) {
            emit(ValidarCompraPaymentSuccess(payment));
          },
        );
      } else {
        if (paymentValidator.dINHEIRO! > book.preco.valor) {
          emit(
            const ValidarCompraPaymentFailure(
              'O Valor é superior ao do livro',
            ),
          );
        } else {
          emit(
            const ValidarCompraPaymentFailure(
              'O Valor é inferior ao do livro',
            ),
          );
        }
      }
    } else {
      emit(const ValidarCompraPaymentFailure('Pagamento inválido'));
    }
  }

  void reset() {
    emit(ValidarCompraInitial());
  }
}
