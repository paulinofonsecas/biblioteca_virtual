import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pdf_page_reader_state.dart';

class PdfPageReaderCubit extends Cubit<PdfPageReaderState> {
  PdfPageReaderCubit() : super(PdfPageReaderInitial());

  void initState() {
    emit(const PdfPageReaderChanged());
  }

  void changeState(PdfPageReaderState state) {
    emit(state);
  }
}
