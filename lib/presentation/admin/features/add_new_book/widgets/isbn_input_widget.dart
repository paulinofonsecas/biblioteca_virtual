import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/isbn_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IsbnInputWidget extends HookWidget {
  const IsbnInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    if (getIt.isRegistered<BookModel>()) {
      controller.text = getIt.get<BookModel>().isbn ?? '';
    }

    return TextFormField(
      controller: controller,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
      ),
    );
  }
}
