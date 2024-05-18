import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_pdf_cubit.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PDFInputWidget extends StatelessWidget {
  const PDFInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitleWidget(title: 'Arquivo PDF'),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: double.infinity,
            height: size.height * .2,
            decoration: BoxDecoration(
              color: Colors.deepOrange.withOpacity(.25),
            ),
            child: BlocBuilder<PickPDFCubit, PickPDFState>(
              builder: (context, state) {
                if (state is PickPDFInitial) {
                  return Center(
                    child: TextButton.icon(
                      onPressed: () {
                        context.read<PickPDFCubit>().pickPDF();
                      },
                      icon: const Icon(FontAwesomeIcons.filePdf),
                      label: const Text('Selecionar ficheiro'),
                    ),
                  );
                }

                if (state is PickPDFSuccess) {
                  return Column(
                    children: [
                      const Spacer(),
                      Text(state.path!.split('/').last),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          context.read<PickPDFCubit>().pickPDF();
                        },
                        label: const Text('Selecionar novo ficheiro'),
                        icon: const Icon(Icons.refresh),
                      ),
                      const Gutter(),
                    ],
                  );
                }

                if (state is PickPDFError) {
                  return Center(child: Text('Erro: ${state.message}'));
                }

                return Center(
                  child: TextButton.icon(
                    onPressed: () {
                      context.read<PickPDFCubit>().pickPDF();
                    },
                    icon: const Icon(FontAwesomeIcons.fileImage),
                    label: const Text('Selecionar ficheiro'),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
