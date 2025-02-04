// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bilioteca_virtual/domain/entities/author.dart';

class AuthorModel extends Author {
  AuthorModel({
    required super.id,
    required super.name,
    required super.photo,
    required super.formacao,
    required super.dataNascimento,
  });

  factory AuthorModel.fromEntity(Author entity) {
    return AuthorModel(
      id: entity.id,
      name: entity.name,
      photo: entity.photo,
      dataNascimento: entity.dataNascimento,
      formacao: entity.formacao,
    );
  }

  Author toEntity() {
    return Author(
      id: id,
      name: name,
      photo: photo,
      dataNascimento: dataNascimento,
      formacao: formacao,
    );
  }

  @override
  AuthorModel copyWith({
    String? id,
    String? name,
    String? photo,
  }) {
    return AuthorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      formacao: formacao,
      dataNascimento: dataNascimento,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photo': photo,
      'formacao': formacao,
      'data_nascimento': dataNascimento,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      id: map['id'] as String,
      name: map['name'] as String,
      photo: (map['photo'] ?? '') as String,
      formacao: (map['formacao'] ?? '') as String,
      dataNascimento: (map['data_nascimento'] ?? '') as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthorModel(id: $id, name: $name, photo: $photo)';

  @override
  bool operator ==(covariant AuthorModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.photo == photo;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ photo.hashCode;
}
