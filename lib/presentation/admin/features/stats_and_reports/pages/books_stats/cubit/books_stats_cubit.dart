import 'dart:async';

import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'books_stats_state.dart';

class BooksStatsCubit extends Cubit<BooksStatsState> {
  BooksStatsCubit() : super(const BooksStatsInitial());

  Future<void> getAllBooks() async {
  }
}
