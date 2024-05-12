part of 'home_page_bloc.dart';

abstract class HomePageEvent  extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_home_page_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomHomePageEvent extends HomePageEvent {
  /// {@macro custom_home_page_event}
  const CustomHomePageEvent();
}
