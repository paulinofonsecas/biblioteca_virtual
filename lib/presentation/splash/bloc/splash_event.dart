part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_splash_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomSplashEvent extends SplashEvent {
  const CustomSplashEvent();
}

class SplashStartedEvent extends SplashEvent {
  const SplashStartedEvent();
}
