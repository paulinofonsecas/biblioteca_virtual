// ignore_for_file: inference_failure_on_instance_creation, lines_longer_than_80_chars, avoid_dynamic_calls

import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_in_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/pages/auth/verify_email.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildUsernameFormField(),
            const Gutter(),
            _buildPasswordFormField(),
            const GutterLarge(),
            _loginButtonArea(),
            const GutterLarge(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Precisa de uma conta?'),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed('/sign-up');
                  },
                  child: const Text('Criar conta'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BlocConsumer<AuthBloc, AuthState> _loginButtonArea() {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: BlocProvider.of<AuthBloc>(context),
      listener: (context, state) {
        if (state is SignedInState) {
          BlocProvider.of<AuthBloc>(context).add(CheckLoggingInEvent());

          final role = state.userCredential?.role;
          if (role == 'admin') {
            Modular.to.pushReplacementNamed('/admin');
          } else if (role == 'usuario') {
            Modular.to.pushReplacementNamed('/home-page');
          }
        } else if (state is SignedInPageState || state is GoogleSignInState) {
          Modular.to.pushReplacementNamed('/home-page');
        } else if (state is VerifyEmailPageState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const VerifyEmail(),
            ),
          );
          BlocProvider.of<AuthBloc>(context).add(SendEmailVerificationEvent());
        }
      },
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              Future.delayed(const Duration(seconds: 3), () {
                BlocProvider.of<AuthBloc>(context).add(ErrorAuthEvent());
              });
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorAuthState():
            return Column(
              children: [
                Center(child: Text(state.message)),
                const GutterSmall(),
                _buildLoginButton(context),
              ],
            );
          default:
            return _buildLoginButton(context);
        }
      },
    );
  }

  ConstrainedBox _buildUsernameFormField() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: TextFormField(
        controller: _usernameController,
        decoration: const InputDecoration(
          labelText: 'Email',
          border: UnderlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Introduza o seu E-Mail';
          } else if (!EmailValidator.validate(value)) {
            return 'Introduza um e-mail valido';
          }
          return null;
        },
      ),
    );
  }

  ConstrainedBox _buildPasswordFormField() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: TextFormField(
        controller: _passwordController,
        obscureText: isVisible,
        decoration: InputDecoration(
          labelText: 'Palavra-passe',
          border: const UnderlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Introduza a sua palavra-passe';
          } else if (value.length < 5) {
            return 'A senha precisa ter mais de 5 caracteres!';
          }
          return null;
        },
      ),
    );
  }

  Padding _buildLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<AuthBloc>(context).add(
              SignInEvent(
                signInEntity: SignInEntity(
                  password: _passwordController.text,
                  email: _usernameController.text,
                ),
              ),
            );
          }
        },
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(500, 50),
          textStyle: const TextStyle(fontSize: 18),
        ),
        child: const Text('Entrar'),
      ),
    );
  }

  Widget optionsBox({
    required String? imagePath,
    required Function? onPressed,
    Color? color,
  }) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            imagePath!,
            color: color,
          ),
        ),
      ),
    );
  }
}
