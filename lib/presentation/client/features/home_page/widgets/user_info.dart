import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/my_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  MyUser? getUser() {
    try {
      return getIt<MyUser>();
    } catch (e) {
      Modular.to.navigate('/sign-in');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = getUser();

    return ListTile(
      title: Text(user!.name),
      subtitle: Text(user.credential.user!.email ?? ''),
      trailing: const Icon(Icons.person),
    );
  }
}
