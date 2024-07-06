part of 'preco_input_cubit.dart';

sealed class PrecoInputState extends Equatable {
  const PrecoInputState(this.preco);

  final double preco;

  @override
  List<Object> get props => [preco];
}

final class PrecoInputInitial extends PrecoInputState {
  const PrecoInputInitial() : super(0);
}

final class PrecoInputChanged extends PrecoInputState {
  const PrecoInputChanged(super.preco);
}
