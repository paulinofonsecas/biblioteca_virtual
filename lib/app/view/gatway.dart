import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Gateway extends StatefulWidget {
  const Gateway({super.key});

  @override
  State<Gateway> createState() => _GatewayState();
}

class _GatewayState extends State<Gateway> {
  @override
  void initState() {
    if (getIt<AuthBloc>().state is SignedInPageState) {
      GoRouter.of(context).go('/profile');
    } else {
      GoRouter.of(context).go('/sign-in');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      bloc: getIt<AuthBloc>()..add(CheckLoggingInEvent()),
      builder: (c, v) => BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
