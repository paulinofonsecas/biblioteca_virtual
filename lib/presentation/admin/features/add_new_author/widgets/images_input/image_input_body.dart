import 'dart:io';

import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/cubit/pick_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const width = 100.0;
const height = 100.0;

class ImageInputBody extends StatelessWidget {
  ImageInputBody({super.key, this.author});

  Author? author;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickImageCubit, PickImageState>(
      listener: (context, state) {
        if (state is PickImageError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (author != null) {
          if (state is PickImageSuccess) {
            return Column(
              children: [
                _ImageWidget(state.path!),
                const GutterSmall(),
                _AlterarImagemWidget(
                  titulo: author == null ? 'Definir imagem' : 'Alterar imagem',
                ),
              ],
            );
          }
          return Column(
            children: [
              _ImageWidget(author!.photo!),
              const GutterSmall(),
              _AlterarImagemWidget(
                titulo: author == null ? 'Definir imagem' : 'Alterar imagem',
              ),
            ],
          );
        }
        if (state is PickImageInitial) {
          return Column(
            children: [
              const _EmptyImageWidget(),
              const GutterSmall(),
              _AlterarImagemWidget(
                titulo: author == null ? 'Definir imagem' : 'Alterar imagem',
              ),
            ],
          );
        }

        if (state is PickImageSuccess) {
          return Column(
            children: [
              _ImageWidget(state.path!),
              const GutterSmall(),
              _AlterarImagemWidget(
                titulo: author == null ? 'Definir imagem' : 'Alterar imagem',
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}

class _EmptyImageWidget extends StatelessWidget {
  const _EmptyImageWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.3),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            context.read<PickImageCubit>().pickImage();
          },
          icon: const Icon(FontAwesomeIcons.camera, size: 30),
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget(this.path);

  final String path;

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return const _EmptyImageWidget();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.3),
          shape: BoxShape.circle,
        ),
        child: path.contains('https')
            ? Image.network(
                path,
                fit: BoxFit.fill,
              )
            : Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class _AlterarImagemWidget extends StatelessWidget {
  _AlterarImagemWidget({required this.titulo});
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          context.read<PickImageCubit>().pickImage();
        },
        child: Text(titulo),
      ),
    );
  }
}
