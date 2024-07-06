part of 'autor_input_cubit.dart';

sealed class AutorInputState extends Equatable {
  const AutorInputState(this.text);
  final String text;

  @override
  List<Object> get props => [text];
}

final class AutorInputInitial extends AutorInputState {
  const AutorInputInitial() : super('');
}

final class AutorInputTextChanged extends AutorInputState {
  const AutorInputTextChanged(super.text);
}
