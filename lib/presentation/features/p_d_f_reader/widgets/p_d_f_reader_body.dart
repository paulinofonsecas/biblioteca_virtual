import 'package:bilioteca_virtual/app/cubit/app_brightness_cubit.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/cubit/pdf_page_reader_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFReaderBody extends StatelessWidget {
  const PDFReaderBody({required this.bookId, super.key});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PDFReaderBloc, PDFReaderState>(
      bloc: context.read<PDFReaderBloc>()
        ..add(PDFReaderGetBook(bookId: bookId)),
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        if (state is PDFReaderGetBookLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PDFReaderGetBookLoaded) {
          return PDFViewerCachedFromUrl(
            book: state.book,
            nightMode: Theme.of(context).brightness == Brightness.dark,
          );
        }

        if (state is PDFReaderGetBookError) {
          return Center(
            child: Text(state.error),
          );
        }

        return const Center(
          child: Text('Ocorreu um erro desconhecido'),
        );
      },
    );
  }
}

class PDFViewerCachedFromUrl extends StatefulWidget {
  const PDFViewerCachedFromUrl({
    required this.book,
    required this.nightMode,
    super.key,
  });

  final bool nightMode;
  final BookModel book;

  @override
  State<PDFViewerCachedFromUrl> createState() => _PDFViewerCachedFromUrlState();
}

class _PDFViewerCachedFromUrlState extends State<PDFViewerCachedFromUrl> {
  late PDF pdf;

  @override
  void initState() {
    pdf = PDF(
      swipeHorizontal: context.read<PdfPageReaderCubit>().state.swipeHorizontal,
      autoSpacing: context.read<PdfPageReaderCubit>().state.autoSpacing,
      nightMode: widget.nightMode,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.select((AppBrightnessCubit cubit) {
      setState(() {
        pdf = const PDF(
          swipeHorizontal: true,
          nightMode: true,
        );
      });
      return cubit;
    });

    return BlocBuilder<PdfPageReaderCubit, PdfPageReaderState>(
      bloc: context.read<PdfPageReaderCubit>()..initState(),
      builder: (context, state) {
        return pdf.cachedFromUrl(
          widget.book.pdf,
          placeholder: (double progress) => Center(
            child: Text(
              '${progress.toInt()} %',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          errorWidget: (dynamic error) => const Center(
            child: Text('Ocorreu um erro ao descarregar o arquivo'),
          ),
        );
      },
    );
  }
}
