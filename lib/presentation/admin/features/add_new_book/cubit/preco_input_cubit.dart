import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'preco_input_state.dart';

class PrecoInputCubit extends Cubit<PrecoInputState> {
  PrecoInputCubit() : super(const PrecoInputInitial());

  void precoChanged(double preco) {
    emit(PrecoInputChanged(preco));
  }
}
