import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'autor_input_state.dart';

class AutorInputCubit extends Cubit<AutorInputState> {
  AutorInputCubit() : super(const AutorInputInitial());

  void changeText(String value) {
    emit(AutorInputTextChanged(value));
  }

  void changeAuthors(List<String> value) {
    print(value);
  }
}
