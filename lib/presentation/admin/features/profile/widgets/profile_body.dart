import 'package:flutter/material.dart';

/// {@template profile_body}
/// Body of the ProfilePage.
///
/// Add what it does
/// {@endtemplate}
class ProfileBody extends StatelessWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/admin/users');
          },
          leading: const Icon(Icons.group),
          title: const Text('Gestão de usuarios'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
