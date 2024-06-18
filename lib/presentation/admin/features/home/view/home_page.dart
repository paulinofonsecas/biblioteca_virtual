import 'package:bilioteca_virtual/presentation/admin/features/home/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/cubit/all_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/cubit/featured_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/widgets/home_body.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/brightness_control.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/global_search_book_widget.dart';
import 'package:flutter/material.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => AllBooksCubit(),
        ),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Biblioteca Digital'),
          actions: const [
            GlobalSearchBookWidget(),
            BrightnessControl(),
          ],
        ),
        body: const HomeView(),
      ),
    );
  }
}

/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
