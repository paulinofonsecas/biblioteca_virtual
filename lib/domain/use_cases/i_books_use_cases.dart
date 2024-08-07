import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/repositories/i_books_repository.dart';

abstract class IBooksUseCases {
  Future<bool> addBookModel(BookModel book);
  Future<BookModel> getBookModel(String id);
  Future<bool> deleteBookModel(String id);
  Future<List<BookModel>> getBooks({bool cache = true});
  Future<List<BookModel>> getBooksFromAuthor(String authorId);
}

class BooksUseCases implements IBooksUseCases {
  BooksUseCases(this._booksRepository);

  final IBooksRepository _booksRepository;

  @override
  Future<bool> addBookModel(BookModel book) {
    return _booksRepository.addBookModel(book);
  }

  @override
  Future<BookModel> getBookModel(String id) {
    return _booksRepository.getBookModel(id);
  }

  @override
  Future<List<BookModel>> getBooks({bool cache = true}) {
    return _booksRepository.getBooks(cache: cache);
  }

  @override
  Future<bool> deleteBookModel(String id) {
    return _booksRepository.deleteBookModel(id);
  }

  @override
  Future<List<BookModel>> getBooksFromAuthor(String authorId) async { 
    return _booksRepository.getBooksFromAuthor(authorId);
  }
}
