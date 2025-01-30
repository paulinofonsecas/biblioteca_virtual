part of 'stats_and_reports_bloc.dart';

abstract class StatsAndReportsEvent  extends Equatable {
  const StatsAndReportsEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_stats_and_reports_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomStatsAndReportsEvent extends StatsAndReportsEvent {
  /// {@macro custom_stats_and_reports_event}
  const CustomStatsAndReportsEvent();
}
