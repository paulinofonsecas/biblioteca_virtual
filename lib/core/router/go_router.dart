import 'package:bilioteca_virtual/app/view/gatway.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/presentation/pages/auth/sign_in_page.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/presentation/pages/auth/sign_up_page.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/presentation/pages/auth/verify_email.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/presentation/pages/home.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';

final providers = [EmailAuthProvider()];

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/gateway',
  routes: [
    GoRoute(
      path: '/gateway',
      builder: (context, state) => const Gateway(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (contex0t, state) => const SignUp(),
      routes: [
        GoRoute(
          path: 'verify-email',
          builder: (context, state) => const VerifyEmail(),
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(
        providers: providers,
        actions: [
          SignedOutAction((context) {
            GoRouter.of(context).go('/sign-in');
          }),
        ],
      ),
    ),
  ],
);
