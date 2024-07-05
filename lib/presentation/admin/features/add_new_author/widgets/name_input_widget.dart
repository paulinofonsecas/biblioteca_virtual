import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/cubit/name_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NameInputWidget extends StatelessWidget {
  Author? authorOnEditMode;
  NameInputWidget({super.key}){
    authorOnEditMode = Modular.args.data as Author;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) {
              BlocProvider.of<NameInputCubit>(context).changeText(value);
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.user,
                  size: 16,
                ),
              ),
              label: Text(authorOnEditMode == null ? 'Nome do Autor': authorOnEditMode!.name),
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
