import 'dart:developer';

import 'package:bilioteca_virtual/data/erros/duplicate_payment.dart';
import 'package:bilioteca_virtual/domain/entities/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirebasePaymentDatasource {
  Future<void> processPayment(Payment payment);
  Future<void> refundPayment(String paymentId);
  Future<Payment> getPaymentDetails(String paymentId);
  Future<List<Payment>> getAllPayments();
  Future<Payment?> verifyPayment(String transactionId);
}

class FirebasePaymentDatasourceImpl implements IFirebasePaymentDatasource {
  FirebasePaymentDatasourceImpl(FirebaseFirestore? fire)
      : firestore = fire ?? FirebaseFirestore.instance;

  final FirebaseFirestore firestore;
  final String _collentionName = 'payments';

  @override
  Future<List<Payment>> getAllPayments() {
    try {
      return firestore
          .collection(_collentionName)
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
          .collection(_collentionName)
          .doc(paymentId)
          .get()
          .then((value) => Payment.fromMap(value.data()!));
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }

  @override
  Future<void> processPayment(Payment payment) async {
    try {
      final anPaymentExists = await verifyPayment(payment.transactionId);

      // if (anPaymentExists != null) {
      //   throw const DuplicatePayment();
      // }

      return firestore
          .collection(_collentionName)
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
          .collection(_collentionName)
          .doc(paymentId)
          .update({'status': 'refunded'});
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }

  @override
  Future<Payment?> verifyPayment(String transactionId) {
    try {
      return firestore
          .collection(_collentionName)
          .where('transactionId', isEqualTo: transactionId)
          .get()
          .then(
            (value) =>
                value.docs.map((e) => Payment.fromMap(e.data())).firstOrNull,
          );
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }
}
