import 'package:bilioteca_virtual/presentation/authentication/presentation/widgets/auth/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage('assets/home_page_background.gif'),
                height: 200,
                width: 200,
              ),
            ),
            Column(
              children: [
                Text(
                  'Biblioteca Virtual',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const GutterLarge(),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
