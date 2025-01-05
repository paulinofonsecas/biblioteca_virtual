import 'package:bilioteca_virtual/data/models/user_model.dart';

abstract class IUsersDatasource {
  Future<List<UserModel>> getAdminUsers();
  Future<List<UserModel>> getClientsUsers();
}
