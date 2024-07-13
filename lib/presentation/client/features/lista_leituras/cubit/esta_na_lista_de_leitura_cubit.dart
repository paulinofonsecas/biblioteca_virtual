import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_lista_de_leitura_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'esta_na_lista_de_leitura_state.dart';

class EstaNaListaDeLeituraCubit extends Cubit<EstaNaListaDeLeituraState> {
  EstaNaListaDeLeituraCubit() : super(EstaNaListaDeLeituraInitial());

  Future<void> estaNaListaDeLeituras(String id) async {
    emit(EstaNaListaDeLeituraLoading());

    final leituraUseCases = getIt<IListaLeituraUseCases>();

    await leituraUseCases
        .getBookModel(id)
        .then((e) => emit(EstaNaListaDeLeituraSuccess(estaNaLista: e != null)))
        .catchError(
          // ignore: inference_failure_on_untyped_parameter
          (e) => emit(EstaNaListaDeLeituraFailure(message: e.toString())),
        );
  }
}
