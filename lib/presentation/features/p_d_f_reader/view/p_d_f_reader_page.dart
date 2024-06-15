// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/core/router/go_router.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/cubit/pdf_page_reader_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/widgets/p_d_f_reader_body.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/widgets/pdf_reader_page_header.dart';
import 'package:flutter/material.dart';

class PDFReaderPage extends StatefulWidget {
  const PDFReaderPage({
    required this.bookId,
    required this.parent,
    super.key,
    this.onExit,
  });

  final String bookId;
  final String parent;
  final VoidCallback? onExit;

  static Route<dynamic> route({
    required String bookId,
    required String parent,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => PDFReaderPage(
        bookId: bookId,
        parent: parent,
      ),
    );
  }

  @override
  State<PDFReaderPage> createState() => _PDFReaderPageState();
}

class _PDFReaderPageState extends State<PDFReaderPage> {
  bool displayAppBar = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          displayAppBar = !displayAppBar;
        });
        print(displayAppBar);
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PDFReaderBloc(),
          ),
          BlocProvider(
            create: (context) => PdfPageReaderCubit(),
          ),
        ],
        child: PopScope(
          onPopInvoked: (b) {
            router.go(widget.parent);
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Livro'),
              backgroundColor:
                  displayAppBar ? Colors.white : Colors.transparent,
              leading: BackButton(
                onPressed: () {
                  router.go(widget.parent);
                },
              ),
              actions: const [
                PDFReaderPageHeader(),
              ],
            ),
            body: PDFReaderView(
              bookId: widget.bookId,
            ),
          ),
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
