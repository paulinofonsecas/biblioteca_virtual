import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/repositories/i_books_repository.dart';

abstract class IBooksUseCases {
  Future<bool> addBook(Book book);
  Future<Book> getBook(String id);
  Future<List<Book>> getBooks();
}

class BooksUseCases implements IBooksUseCases {
  BooksUseCases(this._booksRepository);

  final IBooksRepository _booksRepository;

  @override
  Future<bool> addBook(Book book) {
    return _booksRepository.addBook(book);
  }

  @override
  Future<Book> getBook(String id) {
    return _booksRepository.getBook(id);
  }

  @override
  Future<List<Book>> getBooks() {
    return _booksRepository.getBooks();
  }
}
