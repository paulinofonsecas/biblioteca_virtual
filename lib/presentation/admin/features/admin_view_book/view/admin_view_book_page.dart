// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/core/router/go_router.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/admin_view_book_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/admin_view_book_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AdminViewBookPage extends StatefulWidget {
  const AdminViewBookPage({
    required this.bookId,
    required this.parent,
    super.key,
  });

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
            leading: BackButton(
              onPressed: () {
                router.go(widget.parent);
              },
            ),
            title: const Text('Detalhes do Livro'),
          ),
          body: AdminViewBookView(
            bookId: widget.bookId,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.go(
                Uri(
                  path: '/admin/read_pdf',
                  queryParameters: {
                    'bookId': widget.bookId,
                    'parent': widget.parent,
                  },
                ).toString(),
              );
            },
            icon: const Icon(FontAwesomeIcons.readme),
            label: const Text('Ler livro'),
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
