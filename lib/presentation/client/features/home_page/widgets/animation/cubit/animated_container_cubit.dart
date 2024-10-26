import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'animated_container_state.dart';

class AnimatedContainerCubit extends Cubit<bool> {
  AnimatedContainerCubit() : super(true);

  void changeColor(bool value) {
    emit(value);
  }
}
