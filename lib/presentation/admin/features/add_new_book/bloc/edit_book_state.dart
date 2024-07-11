part of 'edit_book_bloc.dart';

sealed class EditBookState extends Equatable {
  const EditBookState();

  @override
  List<Object> get props => [];
}

final class EditBookInitial extends EditBookState {}

class EditBookLoading extends EditBookState {
  const EditBookLoading() : super();
}

class EditBookSuccess extends EditBookState {
  const EditBookSuccess() : super();
}

class EditBookError extends EditBookState {
  const EditBookError(
    this.message,
  ) : super();

  final String message;

  @override
  List<Object> get props => [message];
}
