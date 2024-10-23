import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoriaRepository {
  Future<Either<Failure, void>> addCategory(Categoria categoria);

  Future<Either<Failure, List<Categoria>>> getCategories({bool inCache = true});

  Future<Either<Failure, List<Categoria>>> getCategoriesFromBook(String bookId);

  Future<Either<Failure, List<Categoria>>> getCategoriesFromAuthor(
    String authorId,
  );

  Future<Either<Failure, List<Categoria>>> getCategoriesFromBookAndAuthor(
    String bookId,
    String authorId,
  );

  Future<Either<Failure, List<Categoria>>> getCategoriesBySearch(String search);

  Future<bool> deleteCategory(String id);
  Future<bool> adicionarCategory(Map<String, dynamic> json);
}
