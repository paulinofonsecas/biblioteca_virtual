// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/core/router/go_router.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/admin_view_book_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/admin_view_book_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminViewBookPage extends StatefulWidget {
  const AdminViewBookPage({
    required this.bookId,
    required this.parent,
    super.key,
  });

  static void toScreen(String bookId) {
    Modular.to.pushNamed(
      '/admin/view-book/$bookId',
    );
  }

  static Route<dynamic> route(String bookId, String parent) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => AdminViewBookPage(
        bookId: bookId,
        parent: parent,
      ),
    );
  }

  final String bookId;
  final String parent;

  @override
  State<AdminViewBookPage> createState() => _AdminViewBookPageState();
}

class _AdminViewBookPageState extends State<AdminViewBookPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdminViewBookBloc(),
        ),
        BlocProvider(
          create: (context) => AdminViewBookCubit(),
        ),
      ],
      child: PopScope(
        onPopInvoked: (b) {
          router.go(widget.parent);
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.heart, size: 18),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.shareFromSquare, size: 18),
              ),
            ],
          ),
          body: AdminViewBookView(
            bookId: widget.bookId,
          ),
        ),
      ),
    );
  }
}

class AdminViewBookView extends StatelessWidget {
  const AdminViewBookView({required this.bookId, super.key});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    return AdminViewBookBody(
      bookId: bookId,
    );
  }
}
