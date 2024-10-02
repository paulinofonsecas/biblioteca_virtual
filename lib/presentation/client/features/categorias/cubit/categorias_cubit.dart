import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'categorias_state.dart';

class CategoriasCubit extends Cubit<CategoriasState> {
  CategoriasCubit() : super(const CategoriasInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
