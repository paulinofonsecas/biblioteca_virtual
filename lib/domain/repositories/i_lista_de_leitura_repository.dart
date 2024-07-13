import 'package:bilioteca_virtual/domain/entities/book.dart';

abstract class IListaLeituraRepository {
  Future<bool> addBook(BookModel book);
  Future<BookModel> getBookModel(String id);
  Future<bool> deleteBook(String id);
  Future<List<BookModel>> getListaLeitura({bool cache = true});
}
