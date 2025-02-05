// ignore_for_file: avoid_print

import 'dart:io';

import 'package:bilioteca_virtual/presentation/admin/features/home/cubit/all_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/book_datasource.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class BooksStatsBody extends StatefulWidget {
  const BooksStatsBody({super.key});

  @override
  State<BooksStatsBody> createState() => _BooksStatsBodyState();
}

class _BooksStatsBodyState extends State<BooksStatsBody> {
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksCubit, AllBooksState>(
      bloc: context.read<AllBooksCubit>()..getAllBooks(),
      builder: (context, state) {
        if (state is AllBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AllBooksError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is AllBooksLoaded) {
          final booksDataSource = BooksReportDataSource(books: state.books);

          return Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: gerarPDF,
                  child: const Text('Exportar para PDF'),
                ),
                Expanded(
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                      headerColor: Theme.of(context).primaryColor,
                    ),
                    child: SfDataGrid(
                      key: key,
                      source: booksDataSource,
                      allowSorting: true,
                      allowExpandCollapseGroup: true,
                      columns: [
                        GridColumn(
                          columnName: 'title',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Titulo',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'author',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Autor',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'categoria',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          label: Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Categória',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'preco',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          label: Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Preço',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }

  Future<void> gerarPDF() async {
    final result = await Permission.manageExternalStorage.request().isGranted;
    if (!result) {
      const SnackBar(content: Text('Sem permissão para exportar para PDF'));
      return;
    }

    final document = PdfDocument();
    final pdfPage = document.pages.add();
    final headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));

    headerTemplate.graphics.drawString(
      'Relatório de Livros',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 15, 200, 20),
    );

    document.template.top = headerTemplate;

    key.currentState!.exportToPdfGrid().draw(
          page: pdfPage,
          bounds: Rect.zero,
        );

    final bytes = document.saveSync();

    final dir = await path.getApplicationDocumentsDirectory();

    if (!Directory('${dir.absolute.path}/relatorios').existsSync()) {
      Directory('${dir.absolute.path}/relatorios').createSync(recursive: true);
    }

    final fileName = 'relatorio_de_livros_${DateTime.now()}.pdf';
    final p = File('${dir.absolute.path}/relatorios/$fileName')
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes);

    final result0 = await Share.shareXFiles(
      [XFile(p.path)],
      text: 'Great picture',
    );

    if (result0.status == ShareResultStatus.success) {
      print('Thank you for sharing the picture!');
    } else {
      const SnackBar(content: Text('Ocorreu um erro ao exportar para PDF'));
    }
  }
}
