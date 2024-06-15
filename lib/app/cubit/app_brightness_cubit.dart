import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_brightness_state.dart';

class AppBrightnessCubit extends Cubit<AppBrightnessState> {
  AppBrightnessCubit() : super(const AppBrightnessInitial(Brightness.light));

  // change app brightness
  void changeBrightness(Brightness brightness) {
    if (brightness == Brightness.light) {
      emit(const AppBrightnessChanged(Brightness.dark));
    } else {
      emit(const AppBrightnessChanged(Brightness.light));
    }
  }
}
