import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/resumo_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResumoInputWidget extends StatelessWidget {
  const ResumoInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      maxLength: 500,
      onChanged: (value) {
        context.read<ResumoInputCubit>().changeText(value);
      },
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.keyboard,
            size: 16,
          ),
        ),
        // label: const Text('Resumo do livro'),
        hintText: 'Informe em poucas palavras, o resumo do livro.',
        alignLabelWithHint: true,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
      ),
    );
  }
}
