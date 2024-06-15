import 'package:bilioteca_virtual/app/cubit/app_brightness_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrightnessControl extends StatelessWidget {
  const BrightnessControl({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          context.read<AppBrightnessCubit>().state.brightness == Brightness.dark
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.dark_mode),
      onPressed: () {
        context
            .read<AppBrightnessCubit>()
            .changeBrightness(Theme.of(context).brightness);
      },
    );
  }
}
