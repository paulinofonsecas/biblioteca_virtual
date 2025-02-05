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

    return [];
  }

  @override
  Future<List<UserModel>> getClientsUsers() async {
    final users = await _firebaseFirestore
        .collection('users')
        // .where('role', isEqualTo: 'usuario')
        .get()
        .then(
          (value) => value.docs.map(
            (e) {
              final user = e.data();
              return UserModel.fromMap({
                'id': e.id,
                'name': (user['name'] as String?) ?? 'Sem nome',
                'role': user['role'],
                'email': user['email'] ?? '',
                'photoUrl': user['photoUrl'],
              });
            },
          ).toList(),
        );

    // sort
    users.sort((a, b) => a.name.compareTo(b.name));

    return users;
  }
}
