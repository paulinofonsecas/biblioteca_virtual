import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'isbn_input_state.dart';

class IsbnInputCubit extends Cubit<IsbnInputState> {
  IsbnInputCubit() : super(const IsbnInputInitial());

  void changeText(String value) {
    emit(IsbnInputTextChanged(value));
  }
}
