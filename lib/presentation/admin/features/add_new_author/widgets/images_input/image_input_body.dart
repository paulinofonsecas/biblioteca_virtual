import 'dart:io';

import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/cubit/pick_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageInputBody extends StatelessWidget {
  const ImageInputBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleWidget(title: 'Imagem do autor'),
        _ImageWidget(),
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: size.height * .5,
        decoration: BoxDecoration(
          color: Colors.deepOrange.withOpacity(.25),
        ),
        child: BlocBuilder<PickImageCubit, PickImageState>(
          builder: (context, state) {
            if (state is PickImageInitial) {
              return Center(
                child: TextButton.icon(
                  onPressed: () {
                    context.read<PickImageCubit>().pickImage();
                  },
                  icon: const Icon(FontAwesomeIcons.fileImage),
                  label: const Text('Selecionar imagem'),
                ),
              );
            }

            if (state is PickImageSuccess) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    File(state.path!),
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        context.read<PickImageCubit>().pickImage();
                      },
                      icon: const Icon(FontAwesomeIcons.fileImage),
                      label: const Text('Alterar imagem'),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(.4),
                        foregroundColor: Colors.white,
                      ),),
                  ),
                ],
              );
            }

            if (state is PickImageError) {
              return Center(child: Text('Erro: ${state.message}'));
            }

            return Center(
              child: TextButton.icon(
                onPressed: () {
                  context.read<PickImageCubit>().pickImage();
                },
                icon: const Icon(FontAwesomeIcons.fileImage),
                label: const Text('Selecionar imagem'),
              ),
            );
          },
      )),
    );
  }
}
