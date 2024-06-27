import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'name_input_state.dart';

class NameInputCubit extends Cubit<NameInputState> {
  NameInputCubit() : super(const NameInputInitial());

  void changeText(String value) {
    emit(NameInputTextChanged(value));
  }
}
