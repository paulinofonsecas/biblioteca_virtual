import 'package:intl/intl.dart';

String normalizePrice(double value) {
  Intl.defaultLocale = 'pt_BR';

  final formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'Kz',
    decimalDigits: 2,
  );
  return formatter.format(value);
}
