// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/data/models/book_model.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/repositories/i_books_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BooksRepository implements IBooksRepository {
  late final FirebaseFirestore _firestore;
  late final FirebaseStorage _storage;

  BooksRepository() {
    _firestore = getIt();
    _storage = getIt();
  }

  Future<String> _salvarCapaNoStorage(Book book) async {
    final ref = _storage.ref('/capas').child(book.id);
    try {
      return ref.putFile(File(book.capa)).then((p0) => p0.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<String> _salvarArquivoNoStorage(Book book) async {
    try {
      final ref = _storage.ref('pdfs').child(book.id).putFile(File(book.pdf));
      return ref.then((p0) => p0.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> addBook(Book book) async {
    try {
      final capaUrl = await _salvarCapaNoStorage(book);
      final pdfUrl = await _salvarArquivoNoStorage(book);

      final toSaveBook = BookModel.fromEntity(book).copyWith(
        capa: capaUrl,
        pdf: pdfUrl,
      );

      await _firestore.collection('books').doc(book.id).set(toSaveBook.toMap());
      return true;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Book> getBook(String id) {
    // TODO: implement getBook
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getBooks() async {
    final books = await _firestore.collection('books').get().then((value) {
      final saida = <Book>[];
      for (final book in value.docs) {
        final b = BookModel.fromMap(book.data());
        saida.add(b);
      }

      return saida;
    });

    return books;
  }
}
