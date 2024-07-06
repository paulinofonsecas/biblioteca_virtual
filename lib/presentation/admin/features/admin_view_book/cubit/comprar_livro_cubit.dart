import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comprar_livro_state.dart';

class ComprarLivroCubit extends Cubit<ComprarLivroState> {
  ComprarLivroCubit() : super(ComprarLivroInitial());

  void comprarLivro({required BookModel book}) {}

  void validarComprovante() {}
}
