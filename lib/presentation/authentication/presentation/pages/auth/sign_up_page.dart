import 'package:bilioteca_virtual/presentation/authentication/presentation/widgets/auth/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            brightness: Theme.of(context).brightness,
          ),
        ),
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'assets/svgs/online-learning-concept.svg',
                      height: size.height * .2,
                      width: size.height * .2,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SignUpForm(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
