import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_users_datasource.dart';
import 'package:bilioteca_virtual/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    final authUser = FirebaseAuth.instance.currentUser;

    final usersRole = await _firebaseFirestore
        .collection('users')
        .where('role', isEqualTo: 'usuario')
        .get()
        .then(
          (value) => value.docs
              .map(
                (e) => UserModel.fromMap({
                  'id': e.id,
                  'name': e['name'],
                  'role': e['role'],
                  'email': authUser?.email,
                  'photoUrl': e['photoUrl'],
                }),
              )
              .toList(),
        );

    return usersRole;
  }
}
