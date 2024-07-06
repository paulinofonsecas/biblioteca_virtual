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
        title: 'Titulo de exemplo grande',
        autor: '',
        capa:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx4ONp_TLFBtxBvGsPl3Ny-r3l-EYkYjB6pQ&s',
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
