import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'p_d_f_reader_event.dart';
part 'p_d_f_reader_state.dart';

class PDFReaderBloc extends Bloc<PDFReaderEvent, PDFReaderState> {
  PDFReaderBloc() : super(PDFReaderGetBookInitial()) {
    _booksUseCases = getIt<IBooksUseCases>();
    on<PDFReaderGetBook>(_onCustomPDFReaderEvent);
  }

  late final IBooksUseCases _booksUseCases;

  FutureOr<void> _onCustomPDFReaderEvent(
    PDFReaderGetBook event,
    Emitter<PDFReaderState> emit,
  ) {
    emit(PDFReaderGetBookLoading());

    _booksUseCases
        .getBook(event.bookId)
        .then((book) => emit(PDFReaderGetBookLoaded(book)))
        .onError(
          (error, stackTrace) => emit(PDFReaderGetBookError(error.toString())),
        );
  }
}
