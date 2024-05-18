import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/cubit/pdf_page_reader_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/widgets/p_d_f_reader_body.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/widgets/pdf_reader_page_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template p_d_f_reader_page}
/// A description for PDFReaderPage
/// {@endtemplate}
class PDFReaderPage extends StatelessWidget {
  /// {@macro p_d_f_reader_page}
  const PDFReaderPage({required this.book, super.key});

  final Book book;

  /// The static route for PDFReaderPage
  static Route<dynamic> route({required Book book}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => PDFReaderPage(
        book: book,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PDFReaderBloc(
            book: book,
          ),
        ),
        BlocProvider(
          create: (context) => PdfPageReaderCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(book.title),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.close,
            ),
          ),
          actions: const [
            PDFReaderPageHeader(),
          ],
        ),
        body: const PDFReaderView(),
      ),
    );
  }
}

/// {@template p_d_f_reader_view}
/// Displays the Body of PDFReaderView
/// {@endtemplate}
class PDFReaderView extends StatelessWidget {
  /// {@macro p_d_f_reader_view}
  const PDFReaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfPageReaderCubit, PdfPageReaderState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        return const PDFReaderBody();
      },
    );
  }
}
