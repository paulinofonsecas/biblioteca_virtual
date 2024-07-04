part of 'global_search_authors_bloc.dart';

abstract class GlobalSearchAuthorsEvent  extends Equatable {
  const GlobalSearchAuthorsEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_global_search_authors_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomGlobalSearchAuthorsEvent extends GlobalSearchAuthorsEvent {
  /// {@macro custom_global_search_authors_event}
  const CustomGlobalSearchAuthorsEvent();
}
