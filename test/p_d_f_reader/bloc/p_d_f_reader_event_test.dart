// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/bloc/bloc.dart';

void main() {
  group('PDFReaderEvent', () {  
    group('CustomPDFReaderEvent', () {
      test('supports value equality', () {
        expect(
          CustomPDFReaderEvent(),
          equals(const CustomPDFReaderEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomPDFReaderEvent(),
          isNotNull
        );
      });
    });
  });
}
