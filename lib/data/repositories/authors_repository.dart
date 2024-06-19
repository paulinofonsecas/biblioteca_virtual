import 'package:bilioteca_virtual/data/datasource/contracts/i_authors_datasource.dart';
import 'package:bilioteca_virtual/data/models/author_model.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/repositories/i_author_repository.dart';

class AuthorsRepository implements IAuthorsRepository {
  AuthorsRepository(this._datasource);

  final IAuthorsDatasource _datasource;

  @override
  Future<bool> addAuthor(Author author) {
    try {
      return _datasource.addAuthor(AuthorModel.fromEntity(author));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteAuthor(String id) {
    try {
      return _datasource.deleteAuthor(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Author?> getAuthor(String id) {
    try {
      return _datasource.getAuthor(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Author>> getAuthors() {
    try {
      return _datasource.getAuthors();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateAuthor(Author author) {
    try {
      return _datasource.updateAuthor(AuthorModel.fromEntity(author));
    } catch (e) {
      rethrow;
    }
  }
}
