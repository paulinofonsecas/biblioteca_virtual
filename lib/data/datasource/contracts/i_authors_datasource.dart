import 'package:bilioteca_virtual/data/models/author_model.dart';

abstract class IAuthorsDatasource {
  Future<bool> addAuthor(AuthorModel book);
  Future<bool> updateAuthor(AuthorModel book);
  Future<bool> deleteAuthor(String id);
  Future<AuthorModel?> getAuthor(String id);
  Future<List<AuthorModel>> getAuthors();
}
