part of 'global_search_bloc.dart';

abstract class GlobalSearchEvent  extends Equatable {
  const GlobalSearchEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_global_search_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomGlobalSearchEvent extends GlobalSearchEvent {
  /// {@macro custom_global_search_event}
  const CustomGlobalSearchEvent();
}
