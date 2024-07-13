// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_setters_without_getters
import 'package:bilioteca_virtual/data/datasource/contracts/i_lista_de_leitura_datasource.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/repositories/i_lista_de_leitura_repository.dart';

class ListaLeituraRepository implements IListaLeituraRepository {
  ListaLeituraRepository(this._datasource);

  final IListaLeituraDatasource _datasource;

  List<BookModel> _cachedBooks = [];

  set _saveInCache(List<BookModel> books) {
    _cachedBooks = books;
  }

  List<BookModel> get _getCachedBooks {
    return _cachedBooks;
  }

  void cleanCache() {
    _cachedBooks = [];
  }

  @override
  Future<bool> addBook(BookModel book) {
    return _datasource.addBook(book);
  }

  @override
  Future<bool> deleteBook(String id) {
    return _datasource.deleteBook(id);
  }

  @override
  Future<BookModel> getBookModel(String id) {
    return _datasource.getBookModel(id);
  }

  @override
  Future<List<BookModel>> getListaLeitura({bool cache = true}) async {
    if (cache && _cachedBooks.isNotEmpty) {
      return _getCachedBooks;
    }

    final result = await _datasource.getListaLeitura();

    _saveInCache = result;

    return result;
  }
}
