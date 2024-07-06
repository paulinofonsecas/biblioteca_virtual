part of 'all_books_cubit.dart';

sealed class AllBooksState extends Equatable {
  const AllBooksState();

  @override
  List<Object> get props => [];
}

final class AllBooksInitial extends AllBooksState {}

final class AllBooksLoading extends AllBooksState {}

final class AllBooksLoaded extends AllBooksState {
  const AllBooksLoaded({required this.books});

  final List<Book> books;

  @override
  List<Object> get props => [books];
}

final class AllBooksError extends AllBooksState {
  const AllBooksError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
