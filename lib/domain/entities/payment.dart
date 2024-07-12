// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payment {
  final String? id;
  final String bookId;
  final double amount;
  final String transactionId;
  final String? currency;
  final String paymentMethod;
  final DateTime date;

  Payment({
    required this.bookId,
    required this.amount,
    required this.transactionId,
    required this.paymentMethod,
    required this.date,
    this.id,
    this.currency,
  });

  Payment copyWith({
    String? id,
    String? bookId,
    double? amount,
    String? transactionId,
    String? currency,
    String? paymentMethod,
    DateTime? date,
  }) {
    return Payment(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      amount: amount ?? this.amount,
      transactionId: transactionId ?? this.transactionId,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bookId': bookId,
      'amount': amount,
      'transactionId': transactionId,
      'currency': currency,
      'paymentMethod': paymentMethod,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] != null ? map['id'] as String : null,
      bookId: map['bookId'] as String,
      amount: map['amount'] as double,
      transactionId: map['transactionId'] as String,
      currency: map['currency'] != null ? map['currency'] as String : null,
      paymentMethod: map['paymentMethod'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Payment(id: $id, bookId: $bookId, amount: $amount, transactionId: $transactionId, currency: $currency, paymentMethod: $paymentMethod, date: $date)';
  }

  @override
  bool operator ==(covariant Payment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bookId == bookId &&
        other.amount == amount &&
        other.transactionId == transactionId &&
        other.currency == currency &&
        other.paymentMethod == paymentMethod &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bookId.hashCode ^
        amount.hashCode ^
        transactionId.hashCode ^
        currency.hashCode ^
        paymentMethod.hashCode ^
        date.hashCode;
  }
}
