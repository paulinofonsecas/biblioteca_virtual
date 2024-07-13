import 'package:bilioteca_virtual/data/erros/payment_error.dart';

class DuplicatePayment extends PaymentError {
  const DuplicatePayment([super.message]);
}
