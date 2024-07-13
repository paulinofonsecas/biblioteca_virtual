import 'package:bilioteca_virtual/domain/entities/book.dart';

abstract class IListaLeituraDatasource {
  Future<bool> addBook(BookModel book);
  Future<BookModel?> getBookModel(String id);
  Future<bool> deleteBook(String id);
  Future<List<BookModel>> getListaLeitura();
}
