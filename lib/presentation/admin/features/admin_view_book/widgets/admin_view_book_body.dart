// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/admin_view_book_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class AdminViewBookBody extends StatelessWidget {
  const AdminViewBookBody({required this.bookId, super.key});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminViewBookCubit, AdminViewBookState>(
      bloc: context.read<AdminViewBookCubit>()..getBook(bookId),
      builder: (context, state) {
        if (state is AdminViewBookLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AdminViewBookError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is AdminViewBookLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                HeaderPageWidget(
                  book: state.book,
                ),
                BookInfoWidget(book: state.book),
              ],
            ),
          );
        }

        return const Center(child: Text('Erro, tente novamente'));
      },
    );
  }
}

class BookInfoWidget extends StatelessWidget {
  const BookInfoWidget({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          const Gutter(),
          TitleWidget(book: book),
          const GutterSmall(),
          const Divider(),
          const GutterSmall(),
          AuthorWidget(book: book),
          const GutterSmall(),
          ResumoWidget(book: book),
        ],
      ),
    );
  }
}

class ResumoWidget extends StatelessWidget {
  const ResumoWidget({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resumo',
          style: TextStyle(fontSize: 20),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Lorem isup sum dolor sit amet, Lorem isup sum dolor sit amet '
            'Lorem isup sum dolor sit amet, Lorem isup sum dolor sit amet',
          ),
        ),
      ],
    );
  }
}

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Autor: ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          book.autor,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          book.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class HeaderPageWidget extends StatelessWidget {
  const HeaderPageWidget({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * .4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background cover
          const BackgroundWidget(),

          // Book cover
          Positioned(
            bottom: size.height * .03,
            left: size.width * .05,
            right: size.width * .05,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BookCoverWidget(book: book),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * .3,
      child: Stack(
        children: [
          Image.asset(
            'assets/view_background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(.9),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookCoverWidget extends StatelessWidget {
  const BookCoverWidget({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width * .4,
      height: size.height * .3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          // child: Image.asset(
          //   'assets/default_book_cover.jpg',
          //   fit: BoxFit.fill,
          // ),
          child: CachedNetworkImage(
            imageUrl: book.capa,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
