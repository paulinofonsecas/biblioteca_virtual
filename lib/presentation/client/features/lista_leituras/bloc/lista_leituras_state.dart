part of 'lista_leituras_bloc.dart';

/// {@template lista_leituras_state}
/// ListaLeiturasState description
/// {@endtemplate}
class ListaLeiturasState extends Equatable {
  /// {@macro lista_leituras_state}
  const ListaLeiturasState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ListaLeiturasState with property changes
  ListaLeiturasState copyWith({
    String? customProperty,
  }) {
    return ListaLeiturasState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template lista_leituras_initial}
/// The initial state of ListaLeiturasState
/// {@endtemplate}
class ListaLeiturasInitial extends ListaLeiturasState {
  /// {@macro lista_leituras_initial}
  const ListaLeiturasInitial() : super();
}
