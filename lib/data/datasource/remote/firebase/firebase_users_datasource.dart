import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_users_datasource.dart';
import 'package:bilioteca_virtual/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUsersDatasource implements IUsersDatasource {
  FirebaseUsersDatasource() {
    _firebaseFirestore = getIt<FirebaseFirestore>();
  }

  late final FirebaseFirestore _firebaseFirestore;

  @override
  Future<List<UserModel>> getAdminUsers() async {
    final usersRole = await _firebaseFirestore
        .collection('users')
        .where('role', isEqualTo: 'admin')
        .get();

    print(usersRole);

    return [];
  }

  @override
  Future<List<UserModel>> getClientsUsers() {
    // TODO: implement getClientsUsers
    throw UnimplementedError();
  }
}
