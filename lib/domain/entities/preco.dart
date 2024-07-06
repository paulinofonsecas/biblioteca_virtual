// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Preco {
  Preco({
    required this.valor,
  });

  factory Preco.gratis() {
    return Preco(valor: 0);
  }

  final double valor;

  Preco copyWith({
    double? valor,
  }) {
    return Preco(
      valor: valor ?? this.valor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'valor': valor,
    };
  }

  factory Preco.fromMap(Map<String, dynamic> map) {
    return Preco(
      valor: map['valor'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Preco.fromJson(String source) =>
      Preco.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Preco(valor: $valor)';

  @override
  bool operator ==(covariant Preco other) {
    if (identical(this, other)) return true;

    return other.valor == valor;
  }

  @override
  int get hashCode => valor.hashCode;
}
