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
  final String photo;
}
