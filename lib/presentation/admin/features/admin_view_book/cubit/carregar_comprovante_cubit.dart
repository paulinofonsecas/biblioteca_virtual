import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

part 'carregar_comprovante_state.dart';

class CarregarComprovanteCubit extends Cubit<CarregarComprovanteState> {
  CarregarComprovanteCubit() : super(CarregarComprovanteInitial());

  Future<void> selecionarComprovativo() async {
    final file = await FilePicker.platform.pickFiles(
      dialogTitle: 'Selecionar comprovativo',
    );

    if (file != null && file.files.isEmpty) {
      emit(CarregarComprovanteFailed());
    } else {
      final path = file!.files.first.path!;

      if (!path.contains('.pdf')) {
        emit(CarregarComprovanteWrongFileType());
      } else {
        emit(CarregarComprovanteLoaded(path: path));
      }
    }
  }
}
