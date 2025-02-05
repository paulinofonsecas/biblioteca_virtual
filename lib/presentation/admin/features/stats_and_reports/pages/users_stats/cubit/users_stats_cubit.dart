import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'users_stats_state.dart';

class UsersStatsCubit extends Cubit<UsersStatsState> {
  UsersStatsCubit() : super(const UsersStatsInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
