// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/validate_payment_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FazerCheckOutModal extends StatelessWidget {
  const FazerCheckOutModal({
    required this.book,
    super.key,
  });

  final Book book;

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
              _InfoWidget(book: book),
              const GutterSmall(),
              const Divider(),
              _InformationPaymentWidget(book: book),
              const GutterSmall(),
              const Divider(),
              const GutterSmall(),
              ValidatePaymentWidget(book: book),
              const GutterLarge(),
              _ButtonsWidget(book: book),
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

  final Book book;

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
          Modular.to.pushNamed(
            '/admin/read_pdf',
            arguments: {
              'bookId': book.id,
              'parent': '/home-page',
            },
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

  final Book book;

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
          title: 'Banco',
          value: 'BAI',
        ),
        const GutterSmall(),
        const GroupInformation(
          icon: FontAwesomeIcons.creditCard,
          title: 'IBAN',
          value: 'AO06.0040.0000.2323.8763.6341.2',
        ),
        const GutterSmall(),
        const GroupInformation(
          icon: Icons.numbers,
          title: 'Nº Conta',
          value: '1323876363412',
        ),
        const GutterSmall(),
        const GroupInformation(
          icon: FontAwesomeIcons.phone,
          title: 'Nº Telefone',
          value: '925412030',
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

  final Book book;

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
              ),
            ),
            const GutterSmall(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    book.autor,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Text('Saraiva'),
                  const SizedBox(width: 10),
                  Text(
                    '12.000,00 Kz',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const Gutter(),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.heart),
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
              'Efeturar pagamento',
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
