import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_categoria_datasource.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/domain/repositories/i_categoria_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class CategoriaRepository implements ICategoriaRepository {
  CategoriaRepository({
    required ICategoriaDatasource datasource,
  }) : _datasource = datasource;

  final ICategoriaDatasource _datasource;
  final List<Categoria> _cache = [];

  @override
  Future<Either<Failure, void>> addCategory(Categoria categoria) async {
    return _datasource.addCategory(categoria);
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategories({
    bool inCache = true,
  }) async {
    if (inCache && _cache.isNotEmpty) {
      return Right(_cache);
    }

    final categorias = await _datasource.getCategories();

    return categorias.fold(
      Left.new,
      (result) {
        _cache
          ..clear()
          ..addAll(result);

        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategoriesBySearch(
    String search,
  ) async {
    final categorias = await getCategories();
    return categorias.fold(
      Left.new,
      (result) => Right(
        result
            .where(
              (element) =>
                  element.nome.toLowerCase().contains(search.toLowerCase()),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategoriesFromAuthor(
    String authorId,
  ) async {
    // TODO: implement getCategoriesFromAuthor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategoriesFromBook(
    String bookId,
  ) async {
    // TODO: implement getCategoriesFromBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategoriesFromBookAndAuthor(
    String bookId,
    String authorId,
  ) async {
    // TODO: implement getCategoriesFromBookAndAuthor
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCategory(String id) async {
    await FirebaseFirestore.instance.collection('categories').doc(id).delete();
    return true;
  }

  @override
  Future<bool> adicionarCategory(Map<String, dynamic> json) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(json['id'] as String)
        .set(json);
    return true;
  }
}
