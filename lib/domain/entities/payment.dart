// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payment {
  final String? id;
  final double? amount;
  final String? transactionId;
  final String? currency;
  final String? paymentMethod;
  final DateTime? date;

  Payment({
    this.id,
    this.amount,
    this.transactionId,
    this.currency,
    this.paymentMethod,
    this.date,
  });

  Payment copyWith({
    String? id,
    double? amount,
    String? transactionId,
    String? currency,
    String? paymentMethod,
    DateTime? date,
  }) {
    return Payment(
      id: id ?? this.id,
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
      'amount': amount,
      'transactionId': transactionId,
      'currency': currency,
      'paymentMethod': paymentMethod,
      'date': date?.millisecondsSinceEpoch,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] != null ? map['id'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      transactionId:
          map['transactionId'] != null ? map['transactionId'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      paymentMethod:
          map['paymentMethod'] != null ? map['paymentMethod'] as String : null,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Payment(id: $id, amount: $amount, transactionId: $transactionId, currency: $currency, paymentMethod: $paymentMethod, date: $date)';
  }

  @override
  bool operator ==(covariant Payment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.amount == amount &&
        other.transactionId == transactionId &&
        other.currency == currency &&
        other.paymentMethod == paymentMethod &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        transactionId.hashCode ^
        currency.hashCode ^
        paymentMethod.hashCode ^
        date.hashCode;
  }
}
