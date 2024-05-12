import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Biblioteca Virtual'),
      centerTitle: true,
      leading: const DrawerButton(),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 47);
}
