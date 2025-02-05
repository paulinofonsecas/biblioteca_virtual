import 'package:bilioteca_virtual/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class UsersReportDataSource extends DataGridSource {
  UsersReportDataSource({List<UserModel> users = const []}) {
    _users = users
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String?>(
                columnName: 'email',
                value: e.email,
              ),
              DataGridCell<String?>(
                columnName: 'role',
                value: e.role,
              ),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _users = [];

  @override
  List<DataGridRow> get rows => _users;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(16),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}
