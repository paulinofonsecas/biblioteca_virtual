import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categoria_input_state.dart';

class CategoriaInputCubit extends Cubit<CategoriaInputState> {
  CategoriaInputCubit() : super(const CategoriaInputInitial());

  void changeList(List<Categoria> value) {
    emit(CategoriaInputChangedChanged(value));
  }
}
