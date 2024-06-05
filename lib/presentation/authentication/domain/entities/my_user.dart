import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  MyUser({required this.credential, required this.role});

  final UserCredential credential;
  final String role;
}
