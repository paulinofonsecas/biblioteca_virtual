import 'package:bilioteca_virtual/domain/entities/book.dart';

abstract class IBooksRepository {
  Future<bool> addBookModel(BookModel book);
  Future<BookModel> getBookModel(String id);
  Future<List<BookModel>> getBooks();
  Future<bool> deleteBookModel(String id);
}
