import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoriaDatasource {
  Future<Either<Failure, void>> addCategory(Categoria categoria);
  Future<Either<Failure, List<Categoria>>> getCategories();

  Future<Either<Failure, List<Categoria>>> getCategoriesFromBook(String bookId);

  Future<Either<Failure, List<Categoria>>> getCategoriesFromAuthor(
    String authorId,
  );

  Future<Either<Failure, List<Categoria>>> getCategoriesFromBookAndAuthor(
    String bookId,
    String authorId,
  );

  Future<Either<Failure, List<Categoria>>> getCategoriesBySearch(String search);
}
