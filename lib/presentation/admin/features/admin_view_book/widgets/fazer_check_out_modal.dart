// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/corrency.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/view/validate_payment_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.amber[700],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => const ValidatePaymentPage(),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber[700]),
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
        child: const Text('Confirmar Pagamento'),
      ),
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
