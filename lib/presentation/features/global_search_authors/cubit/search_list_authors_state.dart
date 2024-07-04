part of 'search_list_authors_cubit.dart';

sealed class SearchListAuthorsState extends Equatable {
  const SearchListAuthorsState();

  @override
  List<Object> get props => [];
}

final class SearchListAuthorsInitial extends SearchListAuthorsState {}

class SearchListAuthorsLoading extends SearchListAuthorsState {}

final class SearchListAuthorsDeleteLoading extends SearchListAuthorsState {}

final class SearchListAuthorsLoaded extends SearchListAuthorsState {
  const SearchListAuthorsLoaded(this.authors);

  final List<Author> authors;

  @override
  List<Object> get props => [authors];
}

final class SearchListAuthorsError extends SearchListAuthorsState {
  const SearchListAuthorsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
