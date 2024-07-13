// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/bloc.dart';

void main() {
  group('ListaLeiturasEvent', () {  
    group('CustomListaLeiturasEvent', () {
      test('supports value equality', () {
        expect(
          CustomListaLeiturasEvent(),
          equals(const CustomListaLeiturasEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomListaLeiturasEvent(),
          isNotNull
        );
      });
    });
  });
}
