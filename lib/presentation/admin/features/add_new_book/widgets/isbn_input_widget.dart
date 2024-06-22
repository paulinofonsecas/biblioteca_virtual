import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/isbn_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IsbnInputWidget extends StatelessWidget {
  const IsbnInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<IsbnInputCubit>().changeText(value);
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
            FontAwesomeIcons.book,
            size: 16,
          ),
        ),
        label: const Text('ISBN'),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
      ),
    );
  }
}
