// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Author {
  Author({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory Author.nullo() => Author(
        id: '',
        name: '',
        photo: '',
      );

  final String id;
  final String name;
  final String? photo;

  Author copyWith({
    String? id,
    String? name,
    String? photo,
  }) {
    return Author(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photo': photo,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      id: map['id'] as String,
      name: map['name'] as String,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) =>
      Author.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Author(id: $id, name: $name, photo: $photo)';

  @override
  bool operator ==(covariant Author other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.photo == photo;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ photo.hashCode;
}
