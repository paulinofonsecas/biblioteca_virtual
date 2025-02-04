import 'dart:developer';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_authors_datasource.dart';
import 'package:bilioteca_virtual/data/models/author_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthorsDatasource implements IAuthorsDatasource {
  FirebaseAuthorsDatasource() {
    _firebaseFirestore = getIt<FirebaseFirestore>();
  }

  late final FirebaseFirestore _firebaseFirestore;

  @override
  Future<bool> addAuthor(AuthorModel book) async {
    try {
      return _firebaseFirestore
          .collection('authors')
          .doc(book.id)
          .set(book.toMap())
          .then((value) => true)
          .onError((error, stackTrace) {
        log(error.toString());
        return false;
      });
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> updateAuthor(AuthorModel book) async {
    try {
      return _firebaseFirestore
          .collection('authors')
          .doc(book.id)
          .update(book.toMap())
          .then((value) => true);
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteAuthor(String id) async {
    try {
      return _firebaseFirestore
          .collection('authors')
          .doc(id)
          .delete()
          .then((value) {
        return true;
      });
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<AuthorModel?> getAuthor(String id) async {
    try {
      return _firebaseFirestore
          .collection('authors')
          .doc(id)
          .get()
          .then((value) => AuthorModel.fromMap(value.data()!));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<AuthorModel>> getAuthors() async {
    try {
      final results = await _firebaseFirestore.collection('authors').get().then(
            (value) =>
                value.docs.map((e) => AuthorModel.fromMap(e.data())).toList(),
          );
      return results;
    } catch (e) {
      log(e.toString());
      return List<AuthorModel>.empty();
    }
  }
}
