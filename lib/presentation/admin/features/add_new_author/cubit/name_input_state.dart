part of 'name_input_cubit.dart';

sealed class NameInputState extends Equatable {
  const NameInputState(this.text);
  final String text;

  @override
  List<Object> get props => [text];
}

final class NameInputInitial extends NameInputState {
  const NameInputInitial() : super('');
}

final class NameInputTextChanged extends NameInputState {
  const NameInputTextChanged(super.text);
}
