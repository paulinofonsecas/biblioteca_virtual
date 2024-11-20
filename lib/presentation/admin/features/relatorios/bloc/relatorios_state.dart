part of 'relatorios_bloc.dart';

/// {@template relatorios_state}
/// RelatoriosState description
/// {@endtemplate}
class RelatoriosState extends Equatable {
  /// {@macro relatorios_state}
  const RelatoriosState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current RelatoriosState with property changes
  RelatoriosState copyWith({
    String? customProperty,
  }) {
    return RelatoriosState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template relatorios_initial}
/// The initial state of RelatoriosState
/// {@endtemplate}
class RelatoriosInitial extends RelatoriosState {
  /// {@macro relatorios_initial}
  const RelatoriosInitial() : super();
}

class GerandoRalatorio extends RelatoriosState {
  /// {@macro relatorios_initial}
  const GerandoRalatorio() : super();
}

class RalatorioGerado extends RelatoriosState {
  /// {@macro relatorios_initial}
  const RalatorioGerado() : super();
}
