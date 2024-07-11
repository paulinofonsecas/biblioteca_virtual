import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/titulo_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TituloInputWidget extends HookWidget {
  const TituloInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    if (getIt.isRegistered<BookModel>()) {
      controller.text = getIt.get<BookModel>().title;
    }

    return TextFormField(
      controller: controller,
      onChanged: (value) {
        context.read<TituloInputCubit>().changeText(value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Preencha o campo';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.t,
            size: 16,
          ),
        ),
        label: const Text('Título do livro'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
      ),
    );
  }
}
