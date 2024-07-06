import 'package:bilioteca_virtual/app/cubit/app_brightness_cubit.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(AppBrightnessState appBrightnessState) => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: appBrightnessState.brightness,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
