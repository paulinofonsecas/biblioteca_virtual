part of 'books_stats_cubit.dart';

/// {@template books_stats}
/// BooksStatsState description
/// {@endtemplate}
class BooksStatsState extends Equatable {
  const BooksStatsState();

  @override
  List<Object?> get props => [];
}

/// {@template books_stats_initial}
/// The initial state of BooksStatsState
/// {@endtemplate}
class BooksStatsInitial extends BooksStatsState {
  const BooksStatsInitial();
}

class BooksStatsLoading extends BooksStatsState {}

class BooksStatsLoaded extends BooksStatsState {
  const BooksStatsLoaded(this.books);
  final List<BookModel> books;

  @override
  List<Object?> get props => [books];
}

class BooksStatsError extends BooksStatsState {
  const BooksStatsError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
