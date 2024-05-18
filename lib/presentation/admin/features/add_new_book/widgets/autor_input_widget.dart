import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/autor_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AutorInputWidget extends StatelessWidget {
  const AutorInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) {
              context.read<AutorInputCubit>().changeText(value)  ;
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.user,
                  size: 16,
                ),
              ),
              label: const Text('Autor do livro'),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(kDefaultPadding / 2),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
