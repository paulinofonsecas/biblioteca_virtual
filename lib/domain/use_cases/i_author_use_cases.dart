import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/repositories/i_author_repository.dart';

abstract class IAuthorsUseCases {
  Future<bool> addAuthor(Author book);
  Future<bool> updateAuthor(Author book);
  Future<Author?> getAuthor(String id);
  Future<bool> deleteAuthor(String id);
  Future<List<Author>> getAuthors();
}

class AuthorsUseCases implements IAuthorsUseCases {
  AuthorsUseCases(this._authorsRepository);

  final IAuthorsRepository _authorsRepository;

  @override
  Future<bool> addAuthor(Author book) {
    return _authorsRepository.addAuthor(book);
  }

  @override
  Future<bool> updateAuthor(Author book) {
    return _authorsRepository.updateAuthor(book);
  }

  @override
  Future<bool> deleteAuthor(String id) {
    return _authorsRepository.deleteAuthor(id);
  }

  @override
  Future<Author?> getAuthor(String id){
    return _authorsRepository.getAuthor(id);
  }

  @override
  Future<List<Author>> getAuthors() {
    return _authorsRepository.getAuthors();
  }
}
