// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/bloc/bloc.dart';

void main() {
  group('PDFReaderBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          PDFReaderBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final pDFReaderBloc = PDFReaderBloc();
      expect(pDFReaderBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<PDFReaderBloc, PDFReaderState>(
      'CustomPDFReaderEvent emits nothing',
      build: PDFReaderBloc.new,
      act: (bloc) => bloc.add(const CustomPDFReaderEvent()),
      expect: () => <PDFReaderState>[],
    );
  });
}
