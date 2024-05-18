import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/data/models/book_model.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'most_wanted_books_state.dart';

class MostWantedBooksCubit extends Cubit<MostWantedBooksState> {
  MostWantedBooksCubit() : super(MostWantedBooksInitial());

  Future<void> getMostWantedBooks() async {
    emit(MostWantedBooksLoading());
    final firestore = getIt<FirebaseFirestore>();

    unawaited(
      firestore.collection('books').get().then((value) {
        if (value.docs.isNotEmpty) {
          final booksList = value.docs
              .map((book) => BookModel.fromMap(book.data()))
              .toList(growable: true);
          emit(
            MostWantedBooksLoaded(
              books: booksList,
            ),
          );
        } else {
          emit(const MostWantedBooksError(message: 'Nenhum livro encontrado'));
        }
      }),
    );
  }
}
