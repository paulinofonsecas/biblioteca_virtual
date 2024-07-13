class PaymentError implements Exception {
  const PaymentError([this.message]);

  final String? message;
}
