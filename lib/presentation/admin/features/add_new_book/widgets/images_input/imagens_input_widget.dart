import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_capa_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/images_input/capa_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagensInputWidget extends StatelessWidget {
  const ImagensInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<PickCapaImageCubit, PickCapaImageState>(
      builder: (context, state) {
        formKey.currentState?.validate();
        return Column(
          children: [
            FormField(
              key: formKey,
              builder: (field) {
                return Column(
                  children: [
                    if (field.hasError)
                      Text(
                        '* ${field.errorText!}',
                        style: const TextStyle(color: Colors.red),
                      ),
                  ],
                );
              },
              validator: (value) {
                if (context.read<PickCapaImageCubit>().state
                    is! PickCapaImageSuccess) {
                  return 'Selecione a capa do livro';
                } else {
                  return null;
                }
              },
            ),
            const CapaInputWidget(),
          ],
        );
      },
    );
  }
}
