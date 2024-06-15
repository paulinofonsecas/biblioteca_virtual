// ignore_for_file: deprecated_member_use

import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/fazer_check_out_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BuildComprarLivroButton extends StatelessWidget {
  const BuildComprarLivroButton({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              '12.000,00 Kz',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.green[600],
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const GutterLarge(),
            Expanded(
              child: SizedBox(
                width: 200,
                height: 50,
                child: OutlinedButton.icon(
                  icon: const Icon(FontAwesomeIcons.shoppingCart),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green[600],
                  ),
                  onPressed: () {
                    showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) => FazerCheckOutModal(
                        book: book,
                      ),
                    );
                  },
                  label: const Text('Comprar agora'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
