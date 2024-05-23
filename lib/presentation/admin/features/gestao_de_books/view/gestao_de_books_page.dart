import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/cubit/all_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/cubit/featured_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/widgets/gestao_de_books_body.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GestaoDeBooksPage extends StatelessWidget {
  const GestaoDeBooksPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GestaoDeBooksPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GestaoDeBooksBloc(),
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
          title: const Text('Gestão de livros'),
        ),
        body: const PullToRefreshWidget(),
      ),
    );
  }
}

class PullToRefreshWidget extends StatefulWidget {
  const PullToRefreshWidget({super.key});

  @override
  State<PullToRefreshWidget> createState() => _PullToRefreshWidgetState();
}

class _PullToRefreshWidgetState extends State<PullToRefreshWidget> {
  final RefreshController _refreshController = RefreshController();

  Future<void> _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: true,
      header: const WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: () {},
      child: const GestaoDeBooksView(),
    );
  }
}

class GestaoDeBooksView extends StatelessWidget {
  const GestaoDeBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GestaoDeBooksBody();
  }
}
