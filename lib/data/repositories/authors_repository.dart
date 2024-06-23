import 'package:bilioteca_virtual/data/datasource/contracts/i_authors_datasource.dart';
import 'package:bilioteca_virtual/data/models/author_model.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/repositories/i_author_repository.dart';

class AuthorsRepository implements IAuthorsRepository {
  AuthorsRepository(this._datasource);

  final IAuthorsDatasource _datasource;
  List<Author> _cachedAuthors = [];

  @override
  Future<bool> addAuthor(Author author) {
    try {
      _cachedAuthors.clear();
      return _datasource.addAuthor(AuthorModel.fromEntity(author));
    } catch (e) {
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
      await _datasource.updateAuthor(AuthorModel.fromEntity(author));
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
