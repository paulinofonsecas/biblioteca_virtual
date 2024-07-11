part of 'get_books_from_author_cubit.dart';

sealed class GetBooksFromAuthorState extends Equatable {
  const GetBooksFromAuthorState();

  @override
  List<Object> get props => [];
}

final class GetBooksFromAuthorInitial extends GetBooksFromAuthorState {}

final class GetBooksFromAuthorLoading extends GetBooksFromAuthorState {}

final class GetBooksFromAuthorError extends GetBooksFromAuthorState {
  const GetBooksFromAuthorError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class GetBooksFromAuthorLoaded extends GetBooksFromAuthorState {
  const GetBooksFromAuthorLoaded(this.books);

  final List<BookModel> books;

  @override
  List<Object> get props => [books];
}
