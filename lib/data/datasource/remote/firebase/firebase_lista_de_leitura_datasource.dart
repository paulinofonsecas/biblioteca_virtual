import 'dart:developer';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/error/exceptions.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_lista_de_leitura_datasource.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseListaDeLeituraDatasource implements IListaLeituraDatasource {
  FirebaseListaDeLeituraDatasource(this._firestore);

  final FirebaseFirestore _firestore;
  final String collectionPath = 'lista-leituras';

  String get userGroup {
    if (!getIt.isRegistered<MyUser>()) {
      throw UserNotLoggedInException();
    }

    final user = getIt<MyUser>();
    return user.credential.user!.uid;
  }

  @override
  Future<bool> addBook(BookModel book) async {
    try {
      await _firestore
          .collection(collectionPath)
          .doc(userGroup)
          .collection('livros')
          .doc(book.id)
          .set(book.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteBook(String id) {
    try {
      return _firestore
          .collection(collectionPath)
          .doc(userGroup)
          .collection('livros')
          .doc(id)
          .delete()
          .then((e) => true)
          .onError((_, __) => false);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<BookModel?> getBookModel(String id) async {
    try {
      return _firestore
          .collection(collectionPath)
          .doc(userGroup)
          .collection('livros')
          .where('id', isEqualTo: id)
          .get()
          .then((value) {
        final b = BookModel.fromMap(value.docs.first.data());

        return b;
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<BookModel>> getListaLeitura() {
    try {
      return _firestore
          .collection(collectionPath)
          .doc(userGroup)
          .collection('livros')
          .get()
          .then((value) {
        final saida = <BookModel>[];
        for (final book in value.docs) {
          final b = BookModel.fromMap(book.data());
          saida.add(b);
        }

        return saida;
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
