import 'dart:async';

import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/animation/cubit/animated_container_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedeContainer extends StatefulWidget {
  const AnimatedeContainer({super.key});

  @override
  State<AnimatedeContainer> createState() => _AnimatedeContainerState();
}

class _AnimatedeContainerState extends State<AnimatedeContainer> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (t) {
      context.read<AnimatedContainerCubit>().changeColor(true);
      t.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimatedContainerCubit, bool>(
      listener: (context, state) {
        Timer.periodic(const Duration(seconds: 2), (t) {
          context.read<AnimatedContainerCubit>().changeColor(!state);
          t.cancel();
        });
      },
      child: BlocBuilder<AnimatedContainerCubit, bool>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              context.read<AnimatedContainerCubit>().changeColor(!state);
            },
            child: AnimatedContainer(
              width: 80,
              height: 17,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              color: state == true
                  ? Color.fromARGB(255, 207, 207, 207)
                  : const Color.fromARGB(255, 224, 223, 223),
              ),
              duration: const Duration(seconds: 1)
            ),
          );
        },
      ),
    );
  }
}
