class Book {
  Book({
    required this.id,
    required this.title,
    required this.autor,
    required this.capa,
    required this.pdf,
    this.isbn,
    this.editora,
    this.resumo,
  });

  factory Book.nullo() => Book(
        id: '',
        title: '',
        autor: '',
        capa: '',
        pdf: '',
      );

  final String id;
  final String title;
  final String autor;
  final String? isbn;
  final String? editora;
  final String? resumo;
  final String capa;
  final String pdf;
}
