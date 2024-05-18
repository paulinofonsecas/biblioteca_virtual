part of 'p_d_f_reader_bloc.dart';

abstract class PDFReaderEvent  extends Equatable {
  const PDFReaderEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_p_d_f_reader_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomPDFReaderEvent extends PDFReaderEvent {
  /// {@macro custom_p_d_f_reader_event}
  const CustomPDFReaderEvent();
}
