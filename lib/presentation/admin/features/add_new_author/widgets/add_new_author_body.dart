import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/core/util/enums.dart';
import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/cubit/name_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/widgets/images_input/image_input_body.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/widgets/name_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddNewAuthorBody extends StatefulWidget {
  AddNewAuthorBody({super.key, required this.manageMode});
  final ManageMode manageMode;

  @override
  State<AddNewAuthorBody> createState() =>
      _AddNewAuthorBodyState(manageMode: manageMode);
}

class _AddNewAuthorBodyState extends State<AddNewAuthorBody> {
  _AddNewAuthorBodyState({required this.manageMode});

  final ManageMode manageMode;
  @override
  void initState() {
    if (manageMode == ManageMode.edit) {
      context.read<AddNewAuthorBloc>().dataNascimento =
          getIt<Author>().dataNascimento;
      context.read<AddNewAuthorBloc>().formacao = getIt<Author>().formacao;
      context.read<AddNewAuthorBloc>().imagem = getIt<Author>().photo;
      BlocProvider.of<NameInputCubit>(context).changeText(getIt<Author>().name);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewAuthorBloc, AddNewAuthorState>(
      listener: (context, state) async {
        if (state is SaveNewAuthorLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();

          if (state is SaveNewAuthorSuccess) {
            Navigator.of(context).pop();
          }

          if (state is SaveNewAuthorError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageInputBody(
              author:
                  widget.manageMode == ManageMode.edit ? getIt<Author>() : null,
            ),
            const Gutter(),
            NameInputWidget(
              authorOnEditMode:
                  widget.manageMode == ManageMode.edit ? getIt<Author>() : null,
            ),
            const Gutter(),
            TextFormField(
              controller: TextEditingController(
                  text: widget.manageMode == ManageMode.add
                      ? ''
                      : getIt<Author>().dataNascimento),
              onChanged: (value) {
                context.read<AddNewAuthorBloc>().dataNascimento = value;
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.table,
                    size: 16,
                  ),
                ),
                label: const Text('Data de nascimento (Ex.: 12-08-1990)'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                ),
              ),
            ),
            const Gutter(),
            TextFormField(
              controller: TextEditingController(
                  text: widget.manageMode == ManageMode.add
                      ? ''
                      : getIt<Author>().formacao),
              onChanged: (value) {
                context.read<AddNewAuthorBloc>().formacao = value;
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.book,
                    size: 16,
                  ),
                ),
                label: const Text('Área de formação'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                ),
              ),
            ),
            const GutterLarge(),
          ],
        ),
      ),
    );
  }
}
