import 'dart:io';

import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/cubit/all_users_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/cubit/cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/users_report_datasource.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

/// {@template users_stats_body}
/// Body of the UsersStatsPage.
///
/// Add what it does
/// {@endtemplate}
class UsersStatsBody extends StatefulWidget {
  /// {@macro users_stats_body}
  const UsersStatsBody({super.key});

  @override
  State<UsersStatsBody> createState() => _UsersStatsBodyState();
}

class _UsersStatsBodyState extends State<UsersStatsBody> {
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUsersCubit, AllUsersState>(
      bloc: context.read<AllUsersCubit>()..getAllUsers(),
      builder: (context, state) {
        if (state is AllUsersLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AllUsersError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is AllUsersLoaded) {
          final usersDataSource = UsersReportDataSource(users: state.users);

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
                      source: usersDataSource,
                      allowSorting: true,
                      allowExpandCollapseGroup: true,
                      tableSummaryRows: [
                        GridTableSummaryRow(
                          title: 'Total usuarios {Sum}',
                          columns: [
                            const GridSummaryColumn(
                              name: 'Sum',
                              columnName: 'name',
                              summaryType: GridSummaryType.count,
                            ),
                          ],
                          position: GridTableSummaryRowPosition.bottom,
                        ),
                      ],
                      columns: [
                        GridColumn(
                          columnName: 'name',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Nome',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'email',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'role',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          label: Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Tipo',
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
      'Relatório de usuarios',
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

    final fileName = 'relatorio_de_usuarios_${DateTime.now()}.pdf';
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
