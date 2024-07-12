import 'dart:developer';

import 'package:bilioteca_virtual/domain/entities/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirebasePaymentDatasource {
  Future<void> processPayment(Payment payment);
  Future<void> refundPayment(String paymentId);
  Future<Payment> getPaymentDetails(String paymentId);
  Future<List<Payment>> getAllPayments();
}

class FirebasePaymentDatasourceImpl implements IFirebasePaymentDatasource {
  FirebasePaymentDatasourceImpl(FirebaseFirestore? fire)
      : firestore = fire ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;

  @override
  Future<List<Payment>> getAllPayments() {
    try {
      return firestore
          .collection('payments')
          .orderBy('date', descending: true)
          .get()
          .then(
            (value) =>
                value.docs.map((e) => Payment.fromMap(e.data())).toList(),
          );
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }

  @override
  Future<Payment> getPaymentDetails(String paymentId) {
    try {
      return firestore
          .collection('payments')
          .doc(paymentId)
          .get()
          .then((value) => Payment.fromMap(value.data()!));
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }

  @override
  Future<void> processPayment(Payment payment) {
    try {
      return firestore
          .collection('payments')
          .doc(payment.id)
          .set(payment.toMap());
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }

  @override
  Future<void> refundPayment(String paymentId) {
    try {
      return firestore
          .collection('payments')
          .doc(paymentId)
          .update({'status': 'refunded'});
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }
}
