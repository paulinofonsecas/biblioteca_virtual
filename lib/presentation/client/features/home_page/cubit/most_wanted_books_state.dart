part of 'most_wanted_books_cubit.dart';

sealed class MostWantedBooksState extends Equatable {
  const MostWantedBooksState();

  @override
  List<Object> get props => [];
}

final class MostWantedBooksInitial extends MostWantedBooksState {}

final class MostWantedBooksLoading extends MostWantedBooksState {}

final class MostWantedBooksLoaded extends MostWantedBooksState {
  const MostWantedBooksLoaded({required this.books});

  final List<BookModel> books;

  @override
  List<Object> get props => [books];
}

final class MostWantedBooksError extends MostWantedBooksState {
  const MostWantedBooksError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
