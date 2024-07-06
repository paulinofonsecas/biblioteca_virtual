// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:flutter/foundation.dart';

class BookModel {
  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.capa,
    required this.pdf,
    required this.preco,
    this.isbn,
    this.editora,
    this.resumo,
  });

  factory BookModel.nullo() => BookModel(
        id: '',
        title: 'Titulo de exemplo grande',
        authors: [],
        capa:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx4ONp_TLFBtxBvGsPl3Ny-r3l-EYkYjB6pQ&s',
        pdf: '',
        preco: Preco(valor: 1200),
      );

  final String id;
  final String title;
  final List<Author> authors;
  final String? isbn;
  final String? editora;
  final String? resumo;
  final String capa;
  final String pdf;
  final Preco preco;

  BookModel copyWith({
    String? id,
    String? title,
    List<Author>? authors,
    String? isbn,
    String? editora,
    String? resumo,
    String? capa,
    String? pdf,
    Preco? preco,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      isbn: isbn ?? this.isbn,
      editora: editora ?? this.editora,
      resumo: resumo ?? this.resumo,
      capa: capa ?? this.capa,
      pdf: pdf ?? this.pdf,
      preco: preco ?? this.preco,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'authors': authors.map((x) => x.toMap()).toList(),
      'isbn': isbn,
      'editora': editora,
      'resumo': resumo,
      'capa': capa,
      'pdf': pdf,
      'preco': preco.toMap(),
    };
  }

  factory BookModel.fromEntity(BookModel book) {
    return BookModel(
      id: book.id,
      title: book.title,
      authors: book.authors,
      isbn: book.isbn,
      editora: book.editora,
      resumo: book.resumo,
      capa: book.capa,
      pdf: book.pdf,
      preco: book.preco,
    );
  }

  BookModel toEntity() => BookModel(
        id: id,
        title: title,
        authors: authors,
        isbn: isbn,
        editora: editora,
        resumo: resumo,
        capa: capa,
        pdf: pdf,
        preco: preco,
      );

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] as String,
      title: map['title'] as String,
      authors: map['authors'] == null
          ? []
          : List<Author>.from(
              (map['authors'] as List<dynamic>)
                  .map((e) => Author.fromMap(e as Map<String, dynamic>)),
            ),
      isbn: map['isbn'] != null ? map['isbn'] as String : null,
      editora: map['editora'] != null ? map['editora'] as String : null,
      resumo: map['resumo'] != null ? map['resumo'] as String : null,
      capa: map['capa'] as String,
      pdf: map['pdf'] as String,
      preco: map['preco'] == null
          ? Preco.gratis()
          : Preco.fromMap(map['preco'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, authors: $authors, isbn: $isbn, editora: $editora, resumo: $resumo, capa: $capa, pdf: $pdf, preco: $preco)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        listEquals(other.authors, authors) &&
        other.isbn == isbn &&
        other.editora == editora &&
        other.resumo == resumo &&
        other.capa == capa &&
        other.pdf == pdf &&
        other.preco == preco;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        authors.hashCode ^
        isbn.hashCode ^
        editora.hashCode ^
        resumo.hashCode ^
        capa.hashCode ^
        pdf.hashCode ^
        preco.hashCode;
  }
}
