part of 'titulo_input_cubit.dart';

sealed class TituloInputState extends Equatable {
  const TituloInputState(this.text);
  final String text;

  @override
  List<Object> get props => [text];
}

final class TituloInputInitial extends TituloInputState {
  const TituloInputInitial() : super('');
}

final class TituloInputTextChanged extends TituloInputState {
  const TituloInputTextChanged(super.text);
}
