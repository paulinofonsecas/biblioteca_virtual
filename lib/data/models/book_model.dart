// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

import 'package:bilioteca_virtual/domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required super.id,
    required super.title,
    required super.autor,
    required super.capa,
    required super.pdf,
    super.isbn,
    super.editora,
    super.resumo,
  });

  Book toEntity() {
    return Book(
      id: id,
      title: title,
      autor: autor,
      capa: capa,
      pdf: pdf,
      isbn: isbn,
      editora: editora,
      resumo: resumo,
    );
  }

  factory BookModel.fromEntity(Book book) {
    return BookModel(
      id: book.id,
      title: book.title,
      autor: book.autor,
      capa: book.capa,
      pdf: book.pdf,
      isbn: book.isbn,
      editora: book.editora,
      resumo: book.resumo,
    );
  }

  BookModel copyWith({
    String? id,
    String? title,
    String? autor,
    String? isbn,
    String? editora,
    String? resumo,
    String? capa,
    String? pdf,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      autor: autor ?? this.autor,
      isbn: isbn ?? this.isbn,
      editora: editora ?? this.editora,
      resumo: resumo ?? this.resumo,
      capa: capa ?? this.capa,
      pdf: pdf ?? this.pdf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'autor': autor,
      'isbn': isbn,
      'editora': editora,
      'resumo': resumo,
      'capa': capa,
      'pdf': pdf,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] as String,
      title: map['title'] as String,
      autor: map['autor'] as String,
      isbn: map['isbn'] != null ? map['isbn'] as String : null,
      editora: map['editora'] != null ? map['editora'] as String : null,
      resumo: map['resumo'] != null ? map['resumo'] as String : null,
      capa: map['capa'] as String,
      pdf: map['pdf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, autor: $autor, isbn: $isbn, '
        'editora: $editora, resumo: $resumo, capa: $capa, pdf: $pdf)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.autor == autor &&
        other.isbn == isbn &&
        other.editora == editora &&
        other.resumo == resumo &&
        other.capa == capa &&
        other.pdf == pdf;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        autor.hashCode ^
        isbn.hashCode ^
        editora.hashCode ^
        resumo.hashCode ^
        capa.hashCode ^
        pdf.hashCode;
  }
}
