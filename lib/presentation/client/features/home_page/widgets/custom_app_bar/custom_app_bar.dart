import 'package:bilioteca_virtual/presentation/global_widgets/brightness_control.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Biblioteca Virtual'),
      centerTitle: true,
      actions: const [
        BrightnessControl(),
      ],
      leading: const DrawerButton(),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 47);
}
