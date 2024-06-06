part of 'compra_livro_bloc.dart';

abstract class CompraLivroEvent  extends Equatable {
  const CompraLivroEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_compra_livro_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomCompraLivroEvent extends CompraLivroEvent {
  /// {@macro custom_compra_livro_event}
  const CustomCompraLivroEvent();
}
