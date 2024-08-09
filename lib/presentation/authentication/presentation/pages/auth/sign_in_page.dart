import 'package:bilioteca_virtual/presentation/authentication/presentation/widgets/auth/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const GutterLarge(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                'assets/svgs/onbording.svg',
                width: size.width * .2,
                height: size.width * .2,
              ),
            ),
            const GutterLarge(),
            const Column(
              children: [
                Text(
                  'Biblioteca Virtual',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
