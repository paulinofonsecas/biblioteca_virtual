part of 'stats_and_reports_bloc.dart';

/// {@template stats_and_reports_state}
/// StatsAndReportsState description
/// {@endtemplate}
class StatsAndReportsState extends Equatable {
  /// {@macro stats_and_reports_state}
  const StatsAndReportsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current StatsAndReportsState with property changes
  StatsAndReportsState copyWith({
    String? customProperty,
  }) {
    return StatsAndReportsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template stats_and_reports_initial}
/// The initial state of StatsAndReportsState
/// {@endtemplate}
class StatsAndReportsInitial extends StatsAndReportsState {
  /// {@macro stats_and_reports_initial}
  const StatsAndReportsInitial() : super();
}
