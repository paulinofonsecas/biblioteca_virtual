import 'dart:typed_data';
import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:bilioteca_virtual/data/repositories/relatorio_repository.dart';

abstract class IGestaoRelatorioUseCase {
  Future<Uint8List> gerarRelatorioUsuario();
  Future<Uint8List> gerarRelatorioObras();
}

class GestaoRelatorioUseCase implements IGestaoRelatorioUseCase {
  GestaoRelatorioUseCase(
      {required this.booksUseCases, required this.repository});

  final IGestaoRelatorioRepository repository;
  final IBooksUseCases booksUseCases;
  @override
  Future<Uint8List> gerarRelatorioUsuario() async {
    final lista = await repository.pegarListaUsuario();

    final doc = pw.Document();
    final resultado = <pw.Widget>[];

    for (final cada in lista) {
      mostrar(cada.toString());
      resultado.add(
        pw.Text('Hello World'),
      );
    }

    // ignore: cascade_invocations
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: resultado,
          );
        },
      ),
    );

    return doc.save();
  }

  @override
  Future<Uint8List> gerarRelatorioObras() async {
    final lista = await booksUseCases.getBooks();

    final doc = pw.Document();
    final resultado = <List<String>>[];
    var i = 1;

    for (final cada in lista) {
      resultado.add(
        [
          i.toString(),
          cada.title,
          cada.preco.toString(),
          cada.editora.toString(),
          cada.resumo.toString(),
        ],
      );
      i++;
    }

    // ignore: cascade_invocations
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.TableHelper.fromTextArray(
            cellPadding: const pw.EdgeInsets.all(6),
              cellAlignment: pw.Alignment.centerLeft,
              cellHeight: 20,
              headerStyle:
                  pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
              headers: [
                'Nº',
                'TITLO',
                'PREÇO',
                'EDITORA',
                'RESUMO',
              ],
              data: resultado);
        },
      ),
    );

    return doc.save();
  }
}
