part of 'discovery_book_cubit.dart';

sealed class DiscoveryBookState extends Equatable {
  const DiscoveryBookState();

  @override
  List<Object> get props => [];
}

final class DiscoveryBookInitial extends DiscoveryBookState {}

final class DiscoveryBookLoading extends DiscoveryBookState {}

final class DiscoveryBookError extends DiscoveryBookState {
  const DiscoveryBookError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class DiscoveryBookLoaded extends DiscoveryBookState {
  const DiscoveryBookLoaded(this.books);

  final List<BookModel> books;

  @override
  List<Object> get props => [books];
}
