part of 'dropdown_category_input_cubit.dart';

sealed class DropdownCategoryInputState extends Equatable {
  const DropdownCategoryInputState();

  @override
  List<Object> get props => [];
}

final class DropdownCategoryInputInitial extends DropdownCategoryInputState {}

final class DropdownCategoryInputLoading extends DropdownCategoryInputState {}

final class DropdownCategoryInputLoaded extends DropdownCategoryInputState {
  const DropdownCategoryInputLoaded(this.lista);

  final List<Categoria> lista;

  @override
  List<Object> get props => [lista];
}

final class DropdownCategoryInputError extends DropdownCategoryInputState {
  const DropdownCategoryInputError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
