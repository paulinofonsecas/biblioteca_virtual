import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_categoria_datasource.dart';
import 'package:bilioteca_virtual/data/repositories/categoria_repository.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/domain/repositories/i_categoria_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DatasourceMock extends Mock implements ICategoriaDatasource {}

void main() {
  late ICategoriaDatasource datasource;
  late ICategoriaRepository categoriaRepository;
  setUp(() {
    datasource = DatasourceMock();
    categoriaRepository = CategoriaRepository(
      datasource: datasource,
    );
  });

  group('Categorias', () {
    test('can get categorias with success in cache', () async {
      final result = await categoriaRepository.getCategories();

      final data = result.getOrElse(() => []);
      expect(data, isA<List<Categoria>>());
      expect(data.length, 0);
    });

    test('can get categorias with success whitout cache', () async {
      when(() => datasource.getCategories()).thenAnswer(
        (_) async => const Right([
          Categoria(id: 'id', nome: 'nome'),
        ]),
      );

      final result = await categoriaRepository.getCategories(inCache: false);

      final data = result.getOrElse(() => []);
      expect(data, isA<List<Categoria>>());
      expect(data.length, 1);
      expect(data.first.id, 'id');
    });

    test('can get categorias with error whitout cache', () async {
      when(() => datasource.getCategories()).thenAnswer(
        (_) async => Left(OfflineFailure()),
      );

      final result = await categoriaRepository.getCategories(inCache: false);

      final data = result.swap().getOrElse(() => GlobalFailure('Erro geral'));
      expect(data, isA<OfflineFailure>());
    });
  });
}
