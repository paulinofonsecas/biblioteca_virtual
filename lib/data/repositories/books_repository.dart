// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_setters_without_getters
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
  List<Book> _cachedBooks = [];

  BooksRepository() {
    _firestore = getIt();
    _storage = getIt();
  }

  set saveInCache(List<Book> books) {
    _cachedBooks = books;
  }

  List<Book> _getCachedBooks() {
    return _cachedBooks;
  }

  void cleanCache() {
    _cachedBooks = [];
  }

  Future<String> _salvarCapaNoStorage(Book book) async {
    final ref = _storage.ref('/capas').child(book.id);
    try {
      return ref.putFile(File(book.capa)).then((p0) => p0.ref.getDownloadURL());
    } on FirebaseException {
      rethrow;
    }
  }

  Future<String> _salvarArquivoNoStorage(Book book) async {
    try {
      final ref = _storage.ref('pdfs').child(book.id).putFile(File(book.pdf));
      return ref.then((p0) => p0.ref.getDownloadURL());
    } on FirebaseException {
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
  Future<Book> getBook(String id) async {
    if (_getCachedBooks().isNotEmpty) {
      return _cachedBooks.firstWhere((element) => element.id == id);
    }

    final book = await _firestore
        .collection('books')
        .where('id', isEqualTo: id)
        .get()
        .then((value) {
      final b = BookModel.fromMap(value.docs.first.data());

      return b;
    });

    return book;
  }

  @override
  Future<List<Book>> getBooks([bool inCache = false]) async {
    if (inCache == true && _cachedBooks.isNotEmpty) {
      return _getCachedBooks();
    }

    final books = await _firestore.collection('books').get().then((value) {
      final saida = <Book>[];
      for (final book in value.docs) {
        final b = BookModel.fromMap(book.data());
        saida.add(b);
      }

      return saida;
    });

    saveInCache = books;
    final result = List<Book>.generate(40, (index) => books.first);
    return result;
  }
}
