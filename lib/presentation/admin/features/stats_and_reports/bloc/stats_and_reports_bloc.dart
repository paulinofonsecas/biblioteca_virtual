import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'stats_and_reports_event.dart';
part 'stats_and_reports_state.dart';

class StatsAndReportsBloc extends Bloc<StatsAndReportsEvent, StatsAndReportsState> {
  StatsAndReportsBloc() : super(const StatsAndReportsInitial()) {
    on<CustomStatsAndReportsEvent>(_onCustomStatsAndReportsEvent);
  }

  FutureOr<void> _onCustomStatsAndReportsEvent(
    CustomStatsAndReportsEvent event,
    Emitter<StatsAndReportsState> emit,
  ) {
    // TODO: Add Logic
  }
}
