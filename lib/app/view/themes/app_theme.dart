import 'package:bilioteca_virtual/app/cubit/app_brightness_cubit.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(AppBrightnessState appBrightnessState) => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: appBrightnessState.brightness,
      ),
    );
