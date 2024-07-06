part of 'autor_input_cubit.dart';

sealed class AutorInputState extends Equatable {
  const AutorInputState(this.authors);
  final List<Author> authors;

  @override
  List<Object> get props => [authors];
}

final class AutorInputInitial extends AutorInputState {
  const AutorInputInitial() : super(const []);
}

final class AuthorsInputChangedChanged extends AutorInputState {
  const AuthorsInputChangedChanged(super.authors);
}
