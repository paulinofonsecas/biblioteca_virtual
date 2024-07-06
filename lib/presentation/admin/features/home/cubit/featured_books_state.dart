part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksError extends FeaturedBooksState {
  const FeaturedBooksError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class FeaturedBooksLoaded extends FeaturedBooksState {
  const FeaturedBooksLoaded(this.books);

  final List<Book> books;

  @override
  List<Object> get props => [books];
}
