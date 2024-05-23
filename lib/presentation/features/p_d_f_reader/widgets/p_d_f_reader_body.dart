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

class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfPageReaderCubit, PdfPageReaderState>(
      bloc: context.read<PdfPageReaderCubit>()..initState(),
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        return PDF(
          swipeHorizontal:
              context.read<PdfPageReaderCubit>().state.swipeHorizontal,
          autoSpacing: context.read<PdfPageReaderCubit>().state.autoSpacing,
          nightMode: context.read<PdfPageReaderCubit>().state.nightMode,
        ).cachedFromUrl(
          book.pdf,
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
