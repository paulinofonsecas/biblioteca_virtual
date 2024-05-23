part of 'authors_bloc.dart';

abstract class AuthorsEvent  extends Equatable {
  const AuthorsEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_authors_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAuthorsEvent extends AuthorsEvent {
  /// {@macro custom_authors_event}
  const CustomAuthorsEvent();
}
