import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'discovery_book_state.dart';

class DiscoveryBookCubit extends Cubit<DiscoveryBookState> {
  DiscoveryBookCubit() : super(DiscoveryBookInitial());
}
