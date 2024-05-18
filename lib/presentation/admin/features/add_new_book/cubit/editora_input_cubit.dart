import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'editora_input_state.dart';

class EditoraInputCubit extends Cubit<EditoraInputState> {
  EditoraInputCubit() : super(const EditoraInputInitial());

  void changeText(String value) {
    emit(EditoraInputTextChanged(value));
  }
}
