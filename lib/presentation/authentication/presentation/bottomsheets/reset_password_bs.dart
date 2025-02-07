// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ResetPasswordBs extends StatefulWidget {
  const ResetPasswordBs({super.key});

  static void show(BuildContext context) {
    showBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      builder: (context) => const ResetPasswordBs(),
    );
  }

  @override
  State<ResetPasswordBs> createState() => _ResetPasswordBsState();
}

class _ResetPasswordBsState extends State<ResetPasswordBs> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Esqueceu a senha?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text('Iremos lhe enviar um e-mail para redefinir sua senha.'),
            const GutterLarge(),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatorio';
                }

                if (!EmailValidator.validate(value)) {
                  return 'E-mail invalido';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            const Gutter(),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text);
                    emailController.clear();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('E-mail de redefinição enviado com sucesso!'),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Erro ao enviar e-mail de redefinição.'),
                      ),
                    );
                  }
                }
              },
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                foregroundColor: Colors.blue,
              ),
              child: const Text('Redefinir minha senha'),
            ),
          ],
        ),
      ),
    );
  }
}
