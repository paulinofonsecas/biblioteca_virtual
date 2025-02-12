import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/carregar_comprovante_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilePickerButton extends StatelessWidget {
  const FilePickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: BlocBuilder<CarregarComprovanteCubit, CarregarComprovanteState>(
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

          if (state is CarregarComprovanteLoading) {
            return const CircularProgressIndicator();
          }

          var title = 'Selecionar comprovativo';
          Color color = Colors.orange;
          var icon = Icons.upload_file;

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
    );
  }
}
