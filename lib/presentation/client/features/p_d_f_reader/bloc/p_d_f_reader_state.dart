part of 'p_d_f_reader_bloc.dart';

/// {@template p_d_f_reader_state}
/// PDFReaderState description
/// {@endtemplate}
class PDFReaderState extends Equatable {
  /// {@macro p_d_f_reader_state}
  const PDFReaderState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current PDFReaderState with property changes
  PDFReaderState copyWith({
    String? customProperty,
  }) {
    return PDFReaderState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template p_d_f_reader_initial}
/// The initial state of PDFReaderState
/// {@endtemplate}
class PDFReaderInitial extends PDFReaderState {
  /// {@macro p_d_f_reader_initial}
  const PDFReaderInitial() : super();
}
