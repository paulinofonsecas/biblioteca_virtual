import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'titulo_input_state.dart';

class TituloInputCubit extends Cubit<TituloInputState> {
  TituloInputCubit() : super(const TituloInputInitial());

  void changeText(String value) {
    emit(TituloInputTextChanged(value));
  }
}
