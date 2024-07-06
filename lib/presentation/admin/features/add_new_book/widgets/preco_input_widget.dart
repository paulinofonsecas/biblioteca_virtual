import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/preco_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrecoInputWidget extends StatelessWidget {
  const PrecoInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<PrecoInputCubit>().precoChanged(double.parse(value));
      },
      validator: (value) {
        if (value != null &&
            value.isNotEmpty &&
            double.tryParse(value) == null) {
          return 'Preço inválido';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          FontAwesomeIcons.moneyBills,
          size: 16,
        ),
        label: const Text('Preço do livro'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
      ),
    );
  }
}
