import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/discovery_book_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/home_categorias_list_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/most_wanted_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/search_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/home_page_body.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/home_page_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String navigateRoute = '/home-page';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBooksCubit(),
        ),
        BlocProvider(
          create: (context) => MostWantedBooksCubit(),
        ),
        BlocProvider(
          create: (context) => DiscoveryBookCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCategoriasListCubit(getIt()),
        ),
      ],
      child: const Scaffold(
        appBar: CustomAppBar(),
        drawer: HomePageDrawer(),
        body: HomePageView(),
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        unawaited(context.read<MostWantedBooksCubit>().getMostWantedBooks());
      },
      child: const HomePageBody(),
    );
  }
}
