import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/domain/repositories/i_categoria_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoriaUseCase {
  Future<Either<Failure, void>> addCategory(Categoria categoria);
  Future<Either<Failure, List<Categoria>>> getCategories({bool inCache});

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

Future<void> setupCategories() async {
  final categoriaUseCase = getIt<ICategoriaUseCase>();
  final categorias = [
    'Ficção',
    'Não-ficção',
    'Mistério e Suspense',
    'Romance',
    'Fantasia',
    'Ciência Ficção',
    'Biografias',
    'Autoajuda',
    'História',
    'Terror',
    'Literatura Clássica',
    'Desenvolvimento Pessoal',
    'Jovem Adulto',
    'Contos e Novelas',
    'Culinária e Gastronomia',
  ];

  for (final cat in categorias) {
    await categoriaUseCase.addCategory(Categoria.make(nome: cat));
  }
}

class CategoriaUseCaseImpl implements ICategoriaUseCase {
  CategoriaUseCaseImpl({required ICategoriaRepository repository})
      : _repository = repository;

  final ICategoriaRepository _repository;

  @override
  Future<Either<Failure, void>> addCategory(Categoria categoria) async {
    return _repository.addCategory(categoria);
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategories({
    bool inCache = true,
  }) async {
    return _repository.getCategories(inCache: inCache);
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategoriesBySearch(
    String search,
  ) {
    // TODO: implement getCategoriesBySearch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategoriesFromAuthor(
    String authorId,
  ) {
    // TODO: implement getCategoriesFromAuthor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategoriesFromBook(
    String bookId,
  ) {
    // TODO: implement getCategoriesFromBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategoriesFromBookAndAuthor(
    String bookId,
    String authorId,
  ) {
    // TODO: implement getCategoriesFromBookAndAuthor
    throw UnimplementedError();
  }
}
