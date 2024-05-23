part of 'p_d_f_reader_bloc.dart';

abstract class PDFReaderEvent extends Equatable {
  const PDFReaderEvent();

  @override
  List<Object> get props => [];
}

class PDFReaderGetBook extends PDFReaderEvent {
  const PDFReaderGetBook({required this.bookId});

  final String bookId;
}
