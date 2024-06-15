part of 'app_brightness_cubit.dart';

sealed class AppBrightnessState extends Equatable {
  const AppBrightnessState(this.brightness);

  final Brightness brightness;

  @override
  List<Object> get props => [brightness];
}

final class AppBrightnessInitial extends AppBrightnessState {
  const AppBrightnessInitial(super.brightness);
}

final class AppBrightnessChanged extends AppBrightnessState {
  const AppBrightnessChanged(super.brightness);
}
