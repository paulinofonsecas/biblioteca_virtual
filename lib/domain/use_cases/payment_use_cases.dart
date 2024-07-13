import 'package:bilioteca_virtual/data/erros/valor_inferior.dart';
import 'package:bilioteca_virtual/data/erros/valor_superior.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/payment.dart';
import 'package:bilioteca_virtual/domain/repositories/i_payment_repository.dart';

abstract class IPaymentUseCases {
  Future<void> processPayment(Payment payment, BookModel book);
  Future<void> refundPayment(String paymentId);
  Future<Payment> getPaymentDetails(String paymentId);
  Future<List<Payment>> getAllPayments();
}

class PaymentUseCases implements IPaymentUseCases {
  PaymentUseCases(this._paymentRepository);

  final IPaymentRepository _paymentRepository;

  @override
  Future<List<Payment>> getAllPayments() {
    return _paymentRepository.getAllPayments();
  }

  @override
  Future<Payment> getPaymentDetails(String paymentId) {
    return _paymentRepository.getPaymentDetails(paymentId);
  }

  @override
  Future<void> processPayment(Payment payment, BookModel book) async {
    if (book.preco.valor < payment.amount) {
      throw const PaymentInferior();
    }

    if (book.preco.valor > payment.amount) {
      throw const PaymentSuperior();
    }

    if (book.preco.valor == payment.amount) {
      return _paymentRepository.processPayment(payment);
    }
  }

  @override
  Future<void> refundPayment(String paymentId) {
    return _paymentRepository.refundPayment(paymentId);
  }
}
