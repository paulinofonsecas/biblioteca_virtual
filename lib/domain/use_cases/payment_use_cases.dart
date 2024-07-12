import 'package:bilioteca_virtual/domain/entities/payment.dart';
import 'package:bilioteca_virtual/domain/repositories/i_payment_repository.dart';

abstract class IPaymentUseCases {
  Future<void> processPayment(Payment payment);
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
  Future<void> processPayment(Payment payment) {
    return _paymentRepository.processPayment(payment);
  }

  @override
  Future<void> refundPayment(String paymentId) {
    return _paymentRepository.refundPayment(paymentId);
  }
}
