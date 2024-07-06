import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'autor_input_state.dart';

class AutorInputCubit extends Cubit<AutorInputState> {
  AutorInputCubit() : super(const AutorInputInitial());

  void changeAuthors(List<Author> value) {
    emit(AuthorsInputChangedChanged(value));
  }
}
