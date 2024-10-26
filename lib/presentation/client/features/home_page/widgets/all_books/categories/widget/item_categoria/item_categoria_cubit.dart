import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'item_categoria_state.dart';

class ItemCategoriaCubit extends Cubit<bool> {
  ItemCategoriaCubit() : super(false);

  void mudarValor(bool valor) {
    emit(valor);
  }
}
