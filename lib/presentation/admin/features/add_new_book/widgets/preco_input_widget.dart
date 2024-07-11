import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/preco_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrecoInputWidget extends HookWidget {
  const PrecoInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    if (getIt.isRegistered<BookModel>()) {
      final preco = getIt.get<BookModel>().preco.valor;

      controller.text = preco.toString();
    }

    return TextFormField(
      controller: controller,
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
