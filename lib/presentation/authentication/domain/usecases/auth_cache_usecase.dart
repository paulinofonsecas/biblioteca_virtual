import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/custom_firebase_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthCacheUsecase {
  AuthCacheUsecase(this._storage);

  final FlutterSecureStorage _storage;

  Future<void> saveUser(CustomFirebaseUser user) {
    return _storage.write(key: 'user', value: user.toJson());
  }

  Future<CustomFirebaseUser?> getUser() async {
    final user = await _storage.read(key: 'user');
    return user == null ? null : CustomFirebaseUser.fromJson(user);
  }

  Future<void> deleteUser() async {
    return _storage.delete(key: 'user');
  }
}
