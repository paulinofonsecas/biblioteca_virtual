import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

part 'pick_pdf_state.dart';

class PickPDFCubit extends Cubit<PickPDFState> {
  PickPDFCubit() : super(const PickPDFInitial());

  Future<void> pickPDF() async {
    try {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

      if (result != null && result.files.first.path != null) {
        emit(PickPDFSuccess(result.files.first.path));
      } else {
        emit(const PickPDFError('Objecto null'));
      }
    } catch (e) {
      emit(PickPDFError(e.toString()));
    }
  }
}
