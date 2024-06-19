part of 'dropdown_autor_input_cubit.dart';

sealed class DropdownAutorInputState extends Equatable {
  const DropdownAutorInputState();

  @override
  List<Object> get props => [];
}

final class DropdownAutorInputInitial extends DropdownAutorInputState {}

final class DropdownAutorInputLoading extends DropdownAutorInputState {}

final class DropdownAutorInputLoaded extends DropdownAutorInputState {
  const DropdownAutorInputLoaded(this.authors);

  final List<Author> authors;

  @override
  List<Object> get props => [authors];
}

final class DropdownAutorInputError extends DropdownAutorInputState {
  const DropdownAutorInputError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
