part of 'esta_na_lista_de_leitura_cubit.dart';

sealed class EstaNaListaDeLeituraState extends Equatable {
  const EstaNaListaDeLeituraState();

  @override
  List<Object> get props => [];
}

final class EstaNaListaDeLeituraInitial extends EstaNaListaDeLeituraState {}

final class EstaNaListaDeLeituraLoading extends EstaNaListaDeLeituraState {}

final class EstaNaListaDeLeituraSuccess extends EstaNaListaDeLeituraState {
  const EstaNaListaDeLeituraSuccess({required this.estaNaLista});
  final bool estaNaLista;

  @override
  List<Object> get props => [estaNaLista];
}

final class EstaNaListaDeLeituraFailure extends EstaNaListaDeLeituraState {
  const EstaNaListaDeLeituraFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
