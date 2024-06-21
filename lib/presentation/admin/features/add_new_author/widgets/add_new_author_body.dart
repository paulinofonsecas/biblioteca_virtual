import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/widgets/images_input/image_input_body.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/widgets/name_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddNewAuthorBody extends StatelessWidget {
  const AddNewAuthorBody({super.key});

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
      child: const SingleChildScrollView(
        child: Column(
          children: [
            NameInputWidget(),
            Gutter(),
            ImageInputBody(),
            GutterLarge(),
          ],
        ),
      ),
    );
  }
}
