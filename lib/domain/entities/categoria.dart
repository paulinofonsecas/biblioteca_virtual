// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:uuid/uuid.dart';

class Categoria {
  final String id;
  final String nome;
  final String? imageUrl;

  Categoria({
    required this.id,
    required this.nome,
    this.imageUrl,
  });

  Categoria copyWith({
    String? id,
    String? nome,
    String? imageUrl,
  }) {
    return Categoria(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'imageUrl': imageUrl,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'] as String,
      nome: map['nome'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  factory Categoria.make({required String nome, String? imageUrl}) {
    return Categoria(
      id: const Uuid().v4(),
      nome: nome,
      imageUrl: imageUrl,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categoria.fromJson(String source) =>
      Categoria.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categoria(id: $id, nome: $nome, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant Categoria other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ imageUrl.hashCode;
}
