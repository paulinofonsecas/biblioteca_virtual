import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dialogo_categoria_event.dart';
part 'dialogo_categoria_state.dart';

class DialogoCategoriaBloc extends Bloc<DialogoCategoriaEvent, DialogoCategoriaState> {
  DialogoCategoriaBloc() : super(DialogoCategoriaInitial()) {
    on<DialogoCategoriaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
