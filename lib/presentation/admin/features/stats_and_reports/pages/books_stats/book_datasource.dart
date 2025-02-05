import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BooksDataSource extends DataGridSource {
  BooksDataSource({List<BookModel> books = const []}) {
    _books = books
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              // DataGridCell<String>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'title', value: e.title),
              DataGridCell<String?>(
                columnName: 'author',
                value: e.authors.firstOrNull?.name,
              ),
              DataGridCell<String?>(
                columnName: 'categoria',
                value: e.categorias.firstOrNull?.nome,
              ),
              DataGridCell<double>(columnName: 'preco', value: e.preco.valor),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _books = [];

  @override
  List<DataGridRow> get rows => _books;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: (dataGridCell.columnName == 'id' ||
                  dataGridCell.columnName == 'Preço')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: const EdgeInsets.all(16),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}
