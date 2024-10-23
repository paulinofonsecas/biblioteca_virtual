import 'dart:developer';
import 'dart:io';

import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_capa_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CapaInputWidget extends StatelessWidget {
  const CapaInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ImageWidget();
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 4,
      ),
      child: BlocConsumer<PickCapaImageCubit, PickCapaImageState>(
        listener: (context, state) {
          if (state is PickCapaImageError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PickCapaImageInitial) {
            return Center(
              child: TextButton.icon(
                onPressed: () {
                  context.read<PickCapaImageCubit>().pickCapaImage();
                },
                icon: const Icon(FontAwesomeIcons.fileImage),
                label: const Text('Selecionar capa'),
              ),
            );
          }

          if (state is PickCapaImageSuccess) {
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: 0.5 / 0.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: state.path!.contains('https')
                        ? Image.network(
                            state.path!,
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            File(state.path!),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      context.read<PickCapaImageCubit>().pickCapaImage();
                    },
                    icon: const Icon(FontAwesomeIcons.fileImage, size: 18),
                    label: const Text('Alterar imagem'),
                  ),
                ),
              ],
            );
          }

          return Center(
            child: TextButton.icon(
              onPressed: () {
                context.read<PickCapaImageCubit>().pickCapaImage();
              },
              icon: const Icon(FontAwesomeIcons.fileImage),
              label: const Text('Selecionar imagem'),
            ),
          );
        },
      ),
    );
  }
}
