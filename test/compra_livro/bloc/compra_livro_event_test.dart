// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/compra_livro/bloc/bloc.dart';

void main() {
  group('CompraLivroEvent', () {  
    group('CustomCompraLivroEvent', () {
      test('supports value equality', () {
        expect(
          CustomCompraLivroEvent(),
          equals(const CustomCompraLivroEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomCompraLivroEvent(),
          isNotNull
        );
      });
    });
  });
}
