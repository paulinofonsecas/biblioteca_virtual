// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/bloc/bloc.dart';

void main() {
  group('PDFReaderState', () {
    test('supports value equality', () {
      expect(
        PDFReaderState(),
        equals(
          const PDFReaderState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const PDFReaderState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const pDFReaderState = PDFReaderState(
            customProperty: 'My property',
          );
          expect(
            pDFReaderState.copyWith(),
            equals(pDFReaderState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const pDFReaderState = PDFReaderState(
            customProperty: 'My property',
          );
          final otherPDFReaderState = PDFReaderState(
            customProperty: 'My property 2',
          );
          expect(pDFReaderState, isNot(equals(otherPDFReaderState)));

          expect(
            pDFReaderState.copyWith(
              customProperty: otherPDFReaderState.customProperty,
            ),
            equals(otherPDFReaderState),
          );
        },
      );
    });
  });
}
