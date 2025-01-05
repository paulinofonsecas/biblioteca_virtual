import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'admin_users_manager_state.dart';

class AdminUsersManagerCubit extends Cubit<AdminUsersManagerState> {
  AdminUsersManagerCubit() : super(const AdminUsersManagerInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
