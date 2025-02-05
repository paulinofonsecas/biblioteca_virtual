part of 'users_stats_cubit.dart';

/// {@template users_stats}
/// UsersStatsState description
/// {@endtemplate}
class UsersStatsState extends Equatable {
  /// {@macro users_stats}
  const UsersStatsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current UsersStatsState with property changes
  UsersStatsState copyWith({
    String? customProperty,
  }) {
    return UsersStatsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template users_stats_initial}
/// The initial state of UsersStatsState
/// {@endtemplate}
class UsersStatsInitial extends UsersStatsState {
  /// {@macro users_stats_initial}
  const UsersStatsInitial() : super();
}
