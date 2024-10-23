import 'package:bilioteca_virtual/domain/entities/author.dart';

abstract class IAuthorsRepository {
  Future<bool> addAuthor(Author book);
  Future<String> _salvarCapaNoStorage(Author author);
  Future<bool> updateAuthor(Author book);
  Future<bool> deleteAuthor(String id);
  Future<Author?> getAuthor(String id);
  Future<List<Author>> getAuthors();
}
