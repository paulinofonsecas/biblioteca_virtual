part of 'dialogo_categoria_bloc.dart';

sealed class DialogoCategoriaState extends Equatable {
  const DialogoCategoriaState();
  
  @override
  List<Object> get props => [];
}

final class DialogoCategoriaInitial extends DialogoCategoriaState {}
