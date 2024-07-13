import 'dart:developer';

import 'package:bilioteca_virtual/data/datasource/contracts/i_lista_de_leitura_datasource.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseListaDeLeituraDatasource implements IListaLeituraDatasource {
  FirebaseListaDeLeituraDatasource(this._firestore);

  final FirebaseFirestore _firestore;
  final String collectionPath = 'lista-leituras';
  final documentId = '123';

  @override
  Future<bool> addBook(BookModel book) async {
    // todo
    // if (!getIt.isRegistered<MyUser>()) {
    //   throw Exception('Usuário não logado');
    // }

    try {
      await _firestore
          .collection(collectionPath)
          .doc(documentId)
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
          .doc(documentId)
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
  Future<BookModel> getBookModel(String id) {
    try {
      return _firestore
          .collection(collectionPath)
          .doc(documentId)
          .collection('livros')
          .where('id', isEqualTo: id)
          .get()
          .then((value) {
        final b = BookModel.fromMap(value.docs.first.data());

        return b;
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<BookModel>> getListaLeitura() {
    try {
      return _firestore
          .collection(collectionPath)
          .doc(documentId)
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
