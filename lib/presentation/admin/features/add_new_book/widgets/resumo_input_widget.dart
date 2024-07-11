import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/resumo_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResumoInputWidget extends HookWidget {
  const ResumoInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    if (getIt.isRegistered<BookModel>()) {
      controller.text = getIt.get<BookModel>().resumo ?? '';
    }

    return TextFormField(
      controller: controller,
      maxLines: 4,
      maxLength: 500,
      onChanged: (value) {
        context.read<ResumoInputCubit>().changeText(value);
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
            FontAwesomeIcons.keyboard,
            size: 16,
          ),
        ),
        contentPadding: const EdgeInsets.all(kDefaultPadding / 2),
        hintText: 'Informe em poucas palavras, o resumo do livro.',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
      ),
    );
  }
}
