// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/corrency.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/validar_compra_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/checkout_button_widget.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/view/p_d_f_reader_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FazerCheckOutModal extends StatefulWidget {
  const FazerCheckOutModal({
    required this.book,
    super.key,
  });

  final BookModel book;

  @override
  State<FazerCheckOutModal> createState() => _FazerCheckOutModalState();
}

class _FazerCheckOutModalState extends State<FazerCheckOutModal> {
  @override
  void initState() {
    if (getIt.isRegistered<BookModel>()) {
      getIt.unregister<BookModel>();
    }
    getIt.registerSingleton<BookModel>(widget.book);
    context.read<ValidarCompraCubit>().reset();
    super.initState();
  }

  @override
  void dispose() {
    getIt.unregister<BookModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeaderWidget(),
              _InfoWidget(book: widget.book),
              const GutterSmall(),
              const Divider(),
              _InformationPaymentWidget(book: widget.book),
              const GutterSmall(),
              const Divider(),
              const GutterSmall(),
              const GutterLarge(),
              _ButtonsWidget(book: widget.book),
              const Gutter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonsWidget extends StatelessWidget {
  const _ButtonsWidget({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidarCompraCubit, ValidarCompraState>(
      listener: (context, state) {
        if (state is ValidarCompraPaymentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        if (state is ValidarCompraPaymentSuccess) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     backgroundColor: Colors.green,
          //     content: Text('Livro adicionado a lista de leitura'),
          //   ),
          // );
        }
      },
      builder: (context, state) {
        if (state is ValidarCompraPaymentLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ValidarCompraPaymentSuccess) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Pagamento concluído',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Gutter(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Fechar'),
                      ),
                      const GutterLarge(),
                      TextButton(
                        onPressed: () {
                          PDFReaderPage.toScreen(book.id);
                        },
                        child: const Text('Abrir livro'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }

        return CheckoutButtonWidget(book: book);
      },
    );
  }
}

class _InformationPaymentWidget extends StatelessWidget {
  const _InformationPaymentWidget({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informações de bancarias',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const GutterSmall(),
        const GroupInformation(
          icon: FontAwesomeIcons.creditCard,
          title: 'Nome',
          value: 'Biblioteca Digital',
        ),
        const GutterSmall(),
        const GroupInformation(
          icon: FontAwesomeIcons.creditCard,
          title: 'IBAN',
          value: 'AO06.0040.0000.2323.8763.6341.2',
        ),
      ],
    );
  }
}

class GroupInformation extends StatelessWidget {
  const GroupInformation({
    required this.icon,
    required this.title,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Gutter(),
            Icon(
              icon,
              color: Colors.grey[600],
              size: 18,
            ),
            const GutterSmall(),
            Text(
              title,
              style: const TextStyle(),
            ),
          ],
        ),
        Row(
          children: [
            const Gutter(),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            const GutterTiny(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.copy, size: 10),
              padding: EdgeInsets.zero,
              splashRadius: 8,
              iconSize: 10,
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const GutterSmall(),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: book.capa,
                height: 85,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const GutterSmall(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      book.authors.firstOrNull?.name ?? 'N/D',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    if (book.editora != null) Text(book.editora!),
                    const SizedBox(width: 10),
                    Text(
                      book.preco == Preco.gratis()
                          ? 'Gratuito'
                          : normalizePrice(book.preco.valor),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Efetuar pagamento',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: const Icon(Icons.info),
        ),
      ],
    );
  }
}
