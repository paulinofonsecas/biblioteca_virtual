part of 'categoria_input_cubit.dart';


sealed class CategoriaInputState extends Equatable {
  const CategoriaInputState(this.lista);
  final List<Categoria> lista;

  @override
  List<Object> get props => [lista];
}

final class CategoriaInputInitial extends CategoriaInputState {
  const CategoriaInputInitial() : super(const []);
}

final class CategoriaInputChangedChanged extends CategoriaInputState {
  const CategoriaInputChangedChanged(super.lista);
}
