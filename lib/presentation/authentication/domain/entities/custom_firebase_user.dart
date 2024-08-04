// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomFirebaseUser {
  final String uid;
  final String email;
  final String password;
  final String role;

  CustomFirebaseUser({
    required this.uid,
    required this.email,
    required this.password,
    required this.role,
  });

  CustomFirebaseUser copyWith({
    String? uid,
    String? email,
    String? password,
    String? role,
  }) {
    return CustomFirebaseUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory CustomFirebaseUser.fromMap(Map<String, dynamic> map) {
    return CustomFirebaseUser(
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomFirebaseUser.fromJson(String source) =>
      CustomFirebaseUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomFirebaseUser(uid: $uid, email: $email, password: $password, role: $role)';
  }

  @override
  bool operator ==(covariant CustomFirebaseUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.password == password &&
        other.role == role;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ email.hashCode ^ password.hashCode ^ role.hashCode;
  }
}
