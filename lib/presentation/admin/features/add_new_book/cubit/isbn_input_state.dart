part of 'isbn_input_cubit.dart';

sealed class IsbnInputState extends Equatable {
  const IsbnInputState(this.text);
  final String text;

  @override
  List<Object> get props => [text];
}

final class IsbnInputInitial extends IsbnInputState {
  const IsbnInputInitial() : super('');
}

final class IsbnInputTextChanged extends IsbnInputState {
  const IsbnInputTextChanged(super.text);
}
