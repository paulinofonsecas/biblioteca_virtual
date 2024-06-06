part of 'comprar_livro_cubit.dart';

sealed class ComprarLivroState extends Equatable {
  const ComprarLivroState();

  @override
  List<Object> get props => [];
}

final class ComprarLivroInitial extends ComprarLivroState {}
