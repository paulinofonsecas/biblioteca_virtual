part of 'p_d_f_reader_bloc.dart';

class PDFReaderState extends Equatable {
  const PDFReaderState();

  @override
  List<Object?> get props => [];
}

class PDFReaderGetBookInitial extends PDFReaderState {}

class PDFReaderGetBookLoading extends PDFReaderState {}

class PDFReaderGetBookError extends PDFReaderState {
  const PDFReaderGetBookError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class PDFReaderGetBookLoaded extends PDFReaderState {
  const PDFReaderGetBookLoaded(this.book) : super();

  final BookModel book;

  @override
  List<Object?> get props => [book];
}
