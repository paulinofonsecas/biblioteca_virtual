import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/carregar_comprovante_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/validar_comprovativo_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/validate_payment.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/widgets/validar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ValidatePaymentBody extends StatelessWidget {
  const ValidatePaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Text(
            'Validação comprovativo',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Expanded(
            child: Column(
              children: [
                Spacer(),
                GutterLarge(),
                _Actions(),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Actions extends StatefulWidget {
  const _Actions();

  @override
  State<_Actions> createState() => _ActionsState();
}

class _ActionsState extends State<_Actions> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidarComprovativoCubit, ValidarComprovativoState>(
      builder: (context, state) {
        if (state is ValidarComprovativoSuccess) {
          return const Center(child: FlutterLogo());
        }

        return Column(
          children: [
            const _FilePickerButton(),
            const Gutter(),
            const Divider(),
            const Gutter(),
            BlocBuilder<ValidarComprovativoCubit, ValidarComprovativoState>(
              builder: (context, state) {
                if (state is ValidarComprovativoLoading) {
                  return const CircularProgressIndicator();
                }

                return const ValidarButtonWidget();
              },
            ),
            BlocBuilder<ValidarComprovativoCubit, ValidarComprovativoState>(
              builder: (context, state) {
                if (state is ValidarComprovativoError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        );
      },
    );
  }
}

class _FilePickerButton extends StatelessWidget {
  const _FilePickerButton();

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
    );
  }
}
