import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_lista_de_leitura_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remover_book_on_lista_leituras_state.dart';

class RemoverBookOnListaLeiturasCubit
    extends Cubit<RemoverBookOnListaLeiturasState> {
  RemoverBookOnListaLeiturasCubit()
      : super(RemoverBookOnListaLeiturasInitial());

  Future<void> removeBook(String id) async {
    emit(RemoverBookOnListaLeiturasLoading());

    final listaLeitura = getIt<IListaLeituraUseCases>();

    await listaLeitura
        .deleteBook(id)
        .then((_) => emit(RemoverBookOnListaLeiturasSuccess()))
        // ignore: inference_failure_on_untyped_parameter
        .catchError((e) => emit(RemoverBookOnListaLeiturasError(e.toString())));
  }
}
