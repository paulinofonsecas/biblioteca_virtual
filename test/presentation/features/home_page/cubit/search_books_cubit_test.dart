import 'package:bilioteca_virtual/presentation/features/home_page/cubit/search_books_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Search Books Cubit', () {
    blocTest<SearchBooksCubit, SearchBooksState>(
      'emits [SearchBooksWordChanged] when SearchBooksWordChange is added.',
      build: SearchBooksCubit.new,
      act: (bloc) => bloc.changeWord('test'),
      expect: () => const <SearchBooksState>[SearchBooksWordChanged('test')],
    );
  });
}
