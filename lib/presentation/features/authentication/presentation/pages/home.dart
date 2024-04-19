// ignore_for_file: inference_failure_on_instance_creation

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedOutState) {
            context.go('/sign-in');
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Home page'),
            actions: [
              TextButton(
                child: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  getIt<AuthBloc>().add(LogOutEvent());
                },
              ),
            ],
          ),
          body: const Center(
            child: Image(
              image: AssetImage('assets/home_page_background.gif'),
            ),
          ),
        ),
      ),
    );
  }
}
