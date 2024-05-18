import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/cubit/pdf_page_reader_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PDFReaderPageHeader extends StatelessWidget {
  const PDFReaderPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<PdfPageReaderCubit, PdfPageReaderState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context
                    .read<PdfPageReaderCubit>()
                    .changeState(state.copyWith(nightMode: !state.nightMode));
              },
              icon: Icon(
                state is PdfPageReaderChanged
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            );
          },
        ),
      ],
    );
  }
}
