import 'dart:math';

import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'most_wanted_books_state.dart';

class MostWantedBooksCubit extends Cubit<MostWantedBooksState> {
  MostWantedBooksCubit() : super(MostWantedBooksInitial());

  Future<void> getMostWantedBooks() async {
    final books = List.generate(
      Random.secure().nextInt(10),
      (index) => Book(),
    );

    emit(MostWantedBooksLoading());
    await Future.delayed(
      const Duration(seconds: 2),
      () => emit(
        MostWantedBooksLoaded(
          books: books,
        ),
      ),
    );
  }
}
