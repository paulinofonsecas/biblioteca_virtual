part of 'lista_leituras_bloc.dart';

abstract class ListaLeiturasEvent  extends Equatable {
  const ListaLeiturasEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_lista_leituras_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomListaLeiturasEvent extends ListaLeiturasEvent {
  /// {@macro custom_lista_leituras_event}
  const CustomListaLeiturasEvent();
}
