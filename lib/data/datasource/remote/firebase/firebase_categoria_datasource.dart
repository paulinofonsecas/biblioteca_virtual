// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_categoria_datasource.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseCategoriaDatasource implements ICategoriaDatasource {
  FirebaseCategoriaDatasource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  late final FirebaseFirestore _firebaseFirestore;

  @override
  Future<Either<Failure, void>> addCategory(Categoria categoria) async {
    try {
      await _firebaseFirestore
          .collection('categories')
          .doc(categoria.id)
          .set(categoria.toMap());
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Categoria>>> getCategories() async {
    try {
      return _firebaseFirestore.collection('categories').get().then((value) {
        final categories = value.docs
            .map(
              (e) => Categoria.fromMap(e.data()),
            )
            .toList();

        return Right(categories);
      });
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure());
    }
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
