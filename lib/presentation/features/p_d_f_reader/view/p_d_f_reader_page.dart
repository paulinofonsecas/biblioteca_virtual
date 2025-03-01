// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/app/cubit/app_brightness_cubit.dart';
import 'package:bilioteca_virtual/core/router/go_router.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/cubit/pdf_page_reader_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/widgets/p_d_f_reader_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
// import 'package:no_screenshot/no_screenshot.dart';

class PDFReaderPage extends StatefulWidget {
  const PDFReaderPage({
    required this.bookId,
    required this.parent,
    super.key,
    this.onExit,
  });

  static void toScreen(String bookId) {
    Modular.to.pushNamed(
      '/admin/read_pdf/$bookId',
    );
  }

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PDFReaderBloc(),
        ),
        BlocProvider(
          create: (context) => PdfPageReaderCubit(),
        ),
      ],
      child: PopScope(
        onPopInvokedWithResult: (_, __) async {
          // await NoScreenshot.instance.screenshotOn();
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Capturas de tela abilitadas'),
          //   ),
          // );
          router.go(widget.parent);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Livro'),
            actions: const [
              // PDFReaderPageHeader(),
            ],
          ),
          body: PDFReaderView(
            bookId: widget.bookId,
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
    return BlocBuilder<AppBrightnessCubit, AppBrightnessState>(
      bloc: context.read<AppBrightnessCubit>(),
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        return PDFReaderBody(
          bookId: bookId,
        );
      },
    );
  }
}
