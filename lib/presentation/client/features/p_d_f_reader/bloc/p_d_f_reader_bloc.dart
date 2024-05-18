import 'dart:async';

import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'p_d_f_reader_event.dart';
part 'p_d_f_reader_state.dart';

class PDFReaderBloc extends Bloc<PDFReaderEvent, PDFReaderState> {
  PDFReaderBloc({required this.book}) : super(const PDFReaderInitial()) {
    on<CustomPDFReaderEvent>(_onCustomPDFReaderEvent);
  }

  final Book book;

  FutureOr<void> _onCustomPDFReaderEvent(
    CustomPDFReaderEvent event,
    Emitter<PDFReaderState> emit,
  ) {
    // TODO: Add Logic
  }
}
