import 'dart:io';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_authors_datasource.dart';
import 'package:bilioteca_virtual/data/models/author_model.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/repositories/i_author_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthorsRepository implements IAuthorsRepository {
  AuthorsRepository(this._datasource) {
    _storage = getIt();
  }

  final IAuthorsDatasource _datasource;
  late final FirebaseStorage _storage;
  List<Author> _cachedAuthors = [];

  @override
  Future<bool> addAuthor(Author author) async {
    try {
      _cachedAuthors.clear();
      if (author.photo != null) {
        if (author.photo!.isNotEmpty &&
            author.photo!.contains('http') == false) {
          author.photo = await _salvarFotoAutor(author);
        }
      }
      return _datasource.addAuthor(AuthorModel.fromEntity(author));
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _salvarFotoAutor(Author author) async {
    final ref = _storage.ref('/fotos_perfil').child(author.id);
    try {
      return ref
          .putFile(File(author.photo!))
          .then((p0) => p0.ref.getDownloadURL());
    } on FirebaseException {
      rethrow;
    }
  }

  @override
  Future<bool> deleteAuthor(String id) {
    try {
      _cachedAuthors.removeWhere((element) => element.id == id);
      return _datasource.deleteAuthor(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Author?> getAuthor(String id) async {
    try {
      if (_cachedAuthors.any((element) => element.id == id)) {
        return Future.value(
          _cachedAuthors.firstWhere((element) => element.id == id),
        );
      }
      final author = await _datasource.getAuthor(id);

      if (author != null) {
        _cachedAuthors.add(author);
      }

      return author;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Author>> getAuthors() async {
    if (_cachedAuthors.isNotEmpty) {
      return Future.value(_cachedAuthors);
    }

    try {
      final authors = await _datasource.getAuthors();

      _cachedAuthors = authors;

      return authors;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateAuthor(Author author) async {
    try {
      _cachedAuthors.clear();
      if (author.photo != null) {
        if (author.photo!.isNotEmpty &&
            author.photo!.contains('http') == false) {
          author.photo = await _salvarFotoAutor(author);
        }
      }
      await _datasource.updateAuthor(AuthorModel.fromEntity(author));
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
