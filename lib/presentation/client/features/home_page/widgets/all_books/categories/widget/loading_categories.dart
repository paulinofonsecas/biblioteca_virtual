import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/animation/animated_container.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/animation/cubit/animated_container_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCategoriesWidget extends StatelessWidget {
  const LoadingCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(10, (i) {
      return BlocProvider(
        create: (context) => AnimatedContainerCubit(),
        child: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: AnimatedeContainer(),
        ),
      );
    }));
  }
}