import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/repositories/i_lista_de_leitura_repository.dart';

abstract class IListaLeituraUseCases {
  Future<bool> addBook(BookModel book);
  Future<BookModel?> getBookModel(String id);
  Future<bool> deleteBook(String id);
  Future<List<BookModel>> getListaLeitura({bool cache = true});
}

class ListaLeituraUseCases implements IListaLeituraUseCases {
  ListaLeituraUseCases(this._listaLeituraRepository);

  final IListaLeituraRepository _listaLeituraRepository;

  @override
  Future<bool> addBook(BookModel book) {
    return _listaLeituraRepository.addBook(book);
  }

  @override
  Future<BookModel?> getBookModel(String id) {
    return _listaLeituraRepository.getBookModel(id);
  }

  @override
  Future<List<BookModel>> getListaLeitura({bool cache = true}) {
    return _listaLeituraRepository.getListaLeitura(cache: cache);
  }

  @override
  Future<bool> deleteBook(String id) {
    return _listaLeituraRepository.deleteBook(id);
  }
}
