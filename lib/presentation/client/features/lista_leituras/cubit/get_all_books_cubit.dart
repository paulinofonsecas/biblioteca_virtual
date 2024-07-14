import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_lista_de_leitura_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_books_state.dart';

class GetAllBooksCubit extends Cubit<GetAllBooksState> {
  GetAllBooksCubit() : super(GetAllBooksInitial());

  Future<void> getAllBooks() async {
    emit(GetAllBooksLoading());

    final listaLeitura = getIt<IListaLeituraUseCases>();

    await listaLeitura.getListaLeitura().then((e) {
      emit(GetAllBooksLoaded(e));
      return e;
    });
  }
}
