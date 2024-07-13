import 'package:bilioteca_virtual/domain/entities/payment.dart';

abstract class IPaymentRepository {
  Future<void> processPayment(Payment payment);
  Future<void> refundPayment(String paymentId);
  Future<Payment> getPaymentDetails(String paymentId);
  Future<List<Payment>> getAllPayments();
}
