import 'dart:math';
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
  Future<Uint8List> gerarRelatorioConsultas();
  Future<Uint8List> gerarRelatorioSistema();
}

class GestaoRelatorioUseCase implements IGestaoRelatorioUseCase {
  GestaoRelatorioUseCase({
    required this.booksUseCases,
    required this.repository,
  });

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
          cada.authors.map((c) => c.name).toList().toString(),
          cada.editora.toString(),
        ],
      );
      i++;
    }

    // ignore: cascade_invocations
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('RELATÓRIO DE OBRAS LITERÁRIAS',
                  style: pw.TextStyle(
                      fontSize: 15, fontWeight: pw.FontWeight.bold)),
              pw.TableHelper.fromTextArray(
                cellPadding: const pw.EdgeInsets.all(6),
                cellAlignment: pw.Alignment.centerLeft,
                cellHeight: 20,
                headerStyle:
                    pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                headers: [
                  'Nº',
                  'TITULO',
                  'PREÇO',
                  'AUTORES',
                  'EDITORA',
                ],
                data: resultado,
              ),
            ],
          );
        },
      ),
    );

    return doc.save();
  }

  @override
  Future<Uint8List> gerarRelatorioConsultas() async {
    final lista = await booksUseCases.getBooks();

    final doc = pw.Document();
    final resultado = <List<String>>[];
    var i = 1;

    for (final cada in lista) {
      resultado.add(
        [
          i.toString(),
          cada.title,
          cada.authors.map((c) => c.name).toList().toString(),
          (0 + Random(5).nextInt(6) * i).toString(),
        ],
      );
      i++;
    }

    // ignore: cascade_invocations
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('RELATÓRIO DE CONSULTAS DE OBRAS',
                  style: pw.TextStyle(
                      fontSize: 15, fontWeight: pw.FontWeight.bold)),
              pw.TableHelper.fromTextArray(
                cellPadding: const pw.EdgeInsets.all(6),
                cellAlignment: pw.Alignment.centerLeft,
                cellHeight: 20,
                headerStyle:
                    pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                headers: [
                  'Nº',
                  'TITULO',
                  'AUTORES',
                  'CONSULTAS',
                ],
                data: resultado,
              ),
            ],
          );
        },
      ),
    );

    return doc.save();
  }

  @override
  Future<Uint8List> gerarRelatorioSistema() async {
    final lista = await booksUseCases.getBooks();

    final doc = pw.Document();
    final resultado = <List<String>>[];
    var i = 1;

    for (final cada in lista) {
      resultado.add(
        [
          i.toString(),
          (0 + Random(5).nextInt(6) * i).toString(),
          (0 + Random(5).nextInt(6) * i).toString(),
          (0 + Random(5).nextInt(6) * i).toString(),
          (0 + Random(5).nextInt(6) * i).toString(),
          (0 + Random(5).nextInt(6) * i).toString(),
        ],
      );
      i++;
    }

    // ignore: cascade_invocations
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('RELATÓRIO GERAL DO SISTEMA',
                  style: pw.TextStyle(
                      fontSize: 15, fontWeight: pw.FontWeight.bold)),
              pw.TableHelper.fromTextArray(
                cellPadding: const pw.EdgeInsets.all(6),
                cellAlignment: pw.Alignment.centerLeft,
                cellHeight: 20,
                headerStyle:
                    pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                headers: [
                  'Nº',
                  'USUARIOS',
                  'ACTIVOS',
                  'ACESSOS DIÁRIO',
                  'INSTALAÇÕES',
                  'ACTUALIZAÇÕES',
                ],
                data: resultado,
              ),
            ],
          );
        },
      ),
    );

    return doc.save();
  }
}
