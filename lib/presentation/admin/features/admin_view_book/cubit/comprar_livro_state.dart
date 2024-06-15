part of 'comprar_livro_cubit.dart';

sealed class ComprarLivroState extends Equatable {
  const ComprarLivroState();

  @override
  List<Object> get props => [];
}

final class ComprarLivroInitial extends ComprarLivroState {}

final class SelectedComprovante extends ComprarLivroState {
  const SelectedComprovante(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}
