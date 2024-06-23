import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/core/util/enums.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/bloc/add_new_author_bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/cubit/name_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/cubit/pick_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/widgets/add_new_author_body.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// {@template add_new_book_page}
/// A description for AddNewAuthorPage
/// {@endtemplate}
class AddNewAuthorPage extends StatelessWidget {
  /// {@macro add_new_book_page}
  const AddNewAuthorPage({required this.manageMode, super.key});

  final ManageMode manageMode;

  /// The static route for AddNewAuthorPage
  // static Route<dynamic> route() {
  //   return MaterialPageRoute<dynamic>(
  //       builder: (_) => AddNewAuthorPage(manageMode: manageMode));
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNewAuthorBloc(),
        ),

        //Inputs
        BlocProvider(
          create: (context) => NameInputCubit(),
        ),

        // para uploads
        BlocProvider(
          create: (context) => PickImageCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                manageMode == ManageMode.add ? 'Novo autor' : 'Editar autor',
              ),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    if (manageMode == ManageMode.add) {
                      context.read<AddNewAuthorBloc>().add(
                            SaveNewAuthorEvent(
                              name: context.read<NameInputCubit>().state.text,
                              path: context.read<PickImageCubit>().state.path,
                              manageMode: manageMode,
                            ),
                          );
                    } else {
                      // context
                      //     .read<AddNewAuthorBloc>()
                      //     .add(SaveNewAuthorEvent(context, manageMode:
                      // manageMode));
                    }
                  },
                  label: const Text('Salvar'),
                  icon: const Icon(FontAwesomeIcons.floppyDisk),
                ),
              ],
            ),
            body: const SafeArea(child: AddNewAuthorView()),
          );
        },
      ),
    );
  }
}

/// {@template add_new_book_view}
/// Displays the Body of AddNewAuthorView
/// {@endtemplate}
class AddNewAuthorView extends StatelessWidget {
  /// {@macro add_new_book_view}
  const AddNewAuthorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: AddNewAuthorBody(),
    );
  }
}
