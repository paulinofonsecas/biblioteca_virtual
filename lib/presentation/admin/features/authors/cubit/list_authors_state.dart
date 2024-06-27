
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:equatable/equatable.dart';

sealed class ListAuthorsState extends Equatable {
  const ListAuthorsState();

  @override
  List<Object> get props => [];
}

final class ListAuthorsInitial extends ListAuthorsState {}

final class ListAuthorsLoading extends ListAuthorsState {}

final class ListAuthorsLoaded extends ListAuthorsState {
  const ListAuthorsLoaded(this.authors);

  final List<Author> authors;

  @override
  List<Object> get props => [authors];
}

final class ListAuthorsError extends ListAuthorsState {
  const ListAuthorsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
