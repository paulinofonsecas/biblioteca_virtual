import 'package:bilioteca_virtual/app/view/gatway.dart';
import 'package:bilioteca_virtual/presentation/admin/admin_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/view/add_new_book_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/view/gestao_de_books_page.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/pages/auth/sign_in_page.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/pages/auth/sign_up_page.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/pages/auth/verify_email.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/view/home_page.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';

final providers = [EmailAuthProvider()];

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/admin/',
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
      path: '/home-page',
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
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminPage(),
      routes: [
        GoRoute(
          path: 'gestao-books',
          builder: (context, state) => const GestaoDeBooksPage(),
          routes: [
            GoRoute(
              path: 'add-new-book',
              builder: (context, state) => const AddNewBookPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
