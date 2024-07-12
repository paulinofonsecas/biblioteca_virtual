import 'package:bilioteca_virtual/data/datasource/remote/firebase/firebase_payment_datasource.dart';
import 'package:bilioteca_virtual/domain/entities/payment.dart';
import 'package:bilioteca_virtual/domain/repositories/i_payment_repository.dart';

class PaymentRepository implements IPaymentRepository {
  PaymentRepository(this._paymentDataSource);
  final FirebasePaymentDatasourceImpl _paymentDataSource;

  @override
  Future<List<Payment>> getAllPayments() {
    return _paymentDataSource.getAllPayments();
  }

  @override
  Future<Payment> getPaymentDetails(String paymentId) {
    return _paymentDataSource.getPaymentDetails(paymentId);
  }

  @override
  Future<void> processPayment(Payment payment) {
    return _paymentDataSource.processPayment(payment);
  }

  @override
  Future<void> refundPayment(String paymentId) {
    return _paymentDataSource.refundPayment(paymentId);
  }
}
