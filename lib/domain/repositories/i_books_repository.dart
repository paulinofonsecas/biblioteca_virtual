import 'package:bilioteca_virtual/domain/entities/book.dart';

abstract class IBooksRepository {
  Future<bool> addBook(Book book);
  Future<Book> getBook(String id);
  Future<List<Book>> getBooks();
  Future<bool> deleteBook(String id);
}
