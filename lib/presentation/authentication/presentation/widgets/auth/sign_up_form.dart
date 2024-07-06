// ignore_for_file: avoid_dynamic_calls

import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_up_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nome completo',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, introduza seu nome completo';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, introduza o seu E-mail';
                  } else if (!EmailValidator.validate(value)) {
                    return 'E-mail invalido';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: TextFormField(
                controller: _passwordController,
                obscureText: isVisible,
                decoration: InputDecoration(
                  labelText: 'Criar uma palavra-passe',
                  border: const OutlineInputBorder(),
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
                    return 'Repita a palavra-passe';
                  } else if (value.length < 5) {
                    return 'A senha precisa ter mais de 5 caracteres!';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: isVisible,
                decoration: const InputDecoration(
                  labelText: 'Confirm password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password confirmation';
                  } else if (value != _passwordController.text) {
                    return "Password doesn't match.";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (_, state) {
                if (state is SignedUpState) {
                  context.pushReplacement('/sign-in');
                }
              },
              builder: (context, state) {
                switch (state) {
                  case LoadingState():
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ErrorAuthState():
                    return Column(
                      children: [
                        Center(
                          child: Text(state.message),
                        ),
                        const Gutter(),
                        _buildLoginButton(context),
                      ],
                    );
                  default:
                    return _buildLoginButton(context);
                }
              },
            ),
            const GutterLarge(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Já tem uma conta?'),
                TextButton(
                  onPressed: () {
                    context.pushReplacement('/sign-in');
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
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
              SignUpEvent(
                signUpEntity: SignUpEntity(
                  name: _usernameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  repeatedPassword: _confirmPasswordController.text,
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
        child: const Text('Cadastrar-se'),
      ),
    );
  }

  Widget optionsBox({
    required String? imagePath,
    required Function? onPressed,
    Color? color,
  }) {
    return InkWell(
      onTap: () => onPressed!(),
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
