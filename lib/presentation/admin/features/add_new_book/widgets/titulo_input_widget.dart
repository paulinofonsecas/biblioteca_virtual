import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/titulo_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TituloInputWidget extends StatelessWidget {
  const TituloInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<TituloInputCubit>().changeText(value);
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
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
      ),
    );
  }
}
