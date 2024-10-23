// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/bloc/bloc.dart';

void main() {
  group('CategoriasLivroEvent', () {  
    group('CustomCategoriasLivroEvent', () {
      test('supports value equality', () {
        expect(
          CustomCategoriasLivroEvent(),
          equals(const CustomCategoriasLivroEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomCategoriasLivroEvent(),
          isNotNull
        );
      });
    });
  });
}
