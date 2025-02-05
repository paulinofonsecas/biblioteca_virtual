import 'package:bilioteca_virtual/data/datasource/contracts/i_users_datasource.dart';
import 'package:bilioteca_virtual/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit(this._usersDatasource) : super(AllUsersInitial());

  final IUsersDatasource _usersDatasource;

  Future<void> getAllUsers() async {
    emit(AllUsersLoading());
    try {
      final users = await _usersDatasource.getClientsUsers();

      emit(AllUsersLoaded(users: users));
    } catch (e) {
      emit(
        const AllUsersError(
          message: 'Ocorreu um erro ao carregar os usuários.',
        ),
      );
    }
  }
}
