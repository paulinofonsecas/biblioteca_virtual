// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/cubit/pdf_page_reader_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/widgets/p_d_f_reader_body.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/widgets/pdf_reader_page_header.dart';
import 'package:flutter/material.dart';

class PDFReaderPage extends StatelessWidget {
  const PDFReaderPage({
    required this.bookId,
    super.key,
    this.onExit,
  });

  final String bookId;
  final VoidCallback? onExit;

  static Route<dynamic> route({required String bookId}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => PDFReaderPage(
        bookId: bookId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PDFReaderBloc(),
        ),
        BlocProvider(
          create: (context) => PdfPageReaderCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Livro'),
          leading: BackButton(
            onPressed: onExit,
          ),
          actions: const [
            PDFReaderPageHeader(),
          ],
        ),
        body: PDFReaderView(
          bookId: bookId,
        ),
      ),
    );
  }
}

class PDFReaderView extends StatelessWidget {
  const PDFReaderView({
    required this.bookId,
    super.key,
  });

  final String bookId;

  @override
  Widget build(BuildContext context) {
    return PDFReaderBody(
      bookId: bookId,
    );
  }
}
