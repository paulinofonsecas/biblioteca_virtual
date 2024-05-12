part of 'gestao_de_books_bloc.dart';

abstract class GestaoDeBooksEvent  extends Equatable {
  const GestaoDeBooksEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_gestao_de_books_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomGestaoDeBooksEvent extends GestaoDeBooksEvent {
  /// {@macro custom_gestao_de_books_event}
  const CustomGestaoDeBooksEvent();
}
