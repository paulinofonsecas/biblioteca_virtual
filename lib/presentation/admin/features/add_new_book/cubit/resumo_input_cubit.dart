import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resumo_input_state.dart';

class ResumoInputCubit extends Cubit<ResumoInputState> {
  ResumoInputCubit() : super(const ResumoInputInitial());

  void changeText(String value) {
    emit(ResumoInputTextChanged(value));
  }
}
