// ignore_for_file: deprecated_member_use

import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/fazer_check_out_modal.dart';
import 'package:flutter/material.dart';
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
        child: OutlinedButton.icon(
          icon: const Icon(FontAwesomeIcons.shoppingBag, size: 18),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(),
            ),
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
    );
  }
}
