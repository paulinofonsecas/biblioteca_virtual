part of 'remover_book_on_lista_leituras_cubit.dart';

sealed class RemoverBookOnListaLeiturasState extends Equatable {
  const RemoverBookOnListaLeiturasState();

  @override
  List<Object> get props => [];
}

final class RemoverBookOnListaLeiturasInitial
    extends RemoverBookOnListaLeiturasState {}

final class RemoverBookOnListaLeiturasLoading
    extends RemoverBookOnListaLeiturasState {}

final class RemoverBookOnListaLeiturasSuccess
    extends RemoverBookOnListaLeiturasState {}

final class RemoverBookOnListaLeiturasError
    extends RemoverBookOnListaLeiturasState {
  const RemoverBookOnListaLeiturasError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
