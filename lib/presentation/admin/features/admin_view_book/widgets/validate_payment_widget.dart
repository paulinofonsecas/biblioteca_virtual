import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/carregar_comprovante_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/p_d_f_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ValidatePaymentWidget extends StatelessWidget {
  const ValidatePaymentWidget({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.info, color: Colors.red[300]),
            const GutterTiny(),
            Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red[400],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Text(
            'Após o pagamento, deverá enviar o comprovativo pelo campos abaixo'
            ' e assim o livro será liberado'),
        const Gutter(),
        Align(
          alignment: Alignment.topCenter,
          child:
              BlocBuilder<CarregarComprovanteCubit, CarregarComprovanteState>(
            builder: (context, state) {
              if (state is CarregarComprovanteFailed) {
                return OutlinedButton.icon(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    context
                        .read<CarregarComprovanteCubit>()
                        .selecionarComprovativo();
                  },
                  label: const Text('Tentar novamente'),
                );
              }
              late String title;
              late Color color;
              late IconData icon;

              if (state is CarregarComprovanteInitial) {
                title = 'Selecionar comprovativo';
                color = Colors.orange;
                icon = Icons.upload_file;
              }

              if (state is CarregarComprovanteLoaded) {
                title = 'Comprovativo selecionado';
                color = Colors.green;
                icon = Icons.refresh;
              }

              if (state is CarregarComprovanteWrongFileType) {
                title = 'Arquivo não suportado';
                color = Colors.red;
                icon = Icons.refresh;
              }

              return Theme(
                data: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: color),
                ),
                child: OutlinedButton.icon(
                  icon: Icon(
                    icon,
                  ),
                  onPressed: () {
                    context
                        .read<CarregarComprovanteCubit>()
                        .selecionarComprovativo();
                  },
                  label: Text(title),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
