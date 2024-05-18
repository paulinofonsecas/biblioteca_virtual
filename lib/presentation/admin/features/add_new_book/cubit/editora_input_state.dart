part of 'editora_input_cubit.dart';

sealed class EditoraInputState extends Equatable {
  const EditoraInputState(this.text);
  final String text;

  @override
  List<Object> get props => [text];
}

final class EditoraInputInitial extends EditoraInputState {
  const EditoraInputInitial() : super('');
}

final class EditoraInputTextChanged extends EditoraInputState {
  const EditoraInputTextChanged(super.text);
}
