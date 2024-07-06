part of 'author_details_bloc.dart';

abstract class AuthorDetailsEvent  extends Equatable {
  const AuthorDetailsEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_author_details_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAuthorDetailsEvent extends AuthorDetailsEvent {
  /// {@macro custom_author_details_event}
  const CustomAuthorDetailsEvent();
}
