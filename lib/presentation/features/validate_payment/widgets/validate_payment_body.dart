import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/core/util/snackbar_message.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/carregar_comprovante_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/validar_comprovativo_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/validate_payment.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/widgets/success_validation_alert_dialog.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/widgets/validar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ValidatePaymentBody extends StatelessWidget {
  const ValidatePaymentBody({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidarComprovativoCubit, ValidarComprovativoState>(
      listener: (context, state) {
        if (state is ValidarComprovativoError) {
          SnackBarMessage.showErrorSnackBar(
            message: state.message,
            context: context,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              'Validação comprovativo',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  const GutterLarge(),
                  _Actions(book),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Actions extends StatefulWidget {
  const _Actions(this.book);

  final BookModel book;

  @override
  State<_Actions> createState() => _ActionsState();
}

class _ActionsState extends State<_Actions> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidarComprovativoCubit, ValidarComprovativoState>(
      listener: (context, state) {
        if (state is ValidarComprovativoSuccess) {
          showDialog(
            context: context,
            builder: (context) =>
                SuccessValidationAlertDialog(state: state.result),
          ).then((e) => Navigator.of(context).pop(state.result));
        }
      },
      builder: (c, s) {
        if (s is ValidarComprovativoLoading) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          );
        }

        return Column(
          children: [
            const _FilePickerButton(),
            const Gutter(),
            const Divider(),
            const Gutter(),
            BlocBuilder<CarregarComprovanteCubit, CarregarComprovanteState>(
              bloc: getIt<CarregarComprovanteCubit>(),
              builder: (context, state) {
                if (state is CarregarComprovanteInitial) {
                  return const SizedBox();
                }

                if (state is CarregarComprovanteLoading) {
                  return const SizedBox();
                }

                if (state is CarregarComprovanteWrongFileType) {
                  return const SizedBox();
                }

                if (state is CarregarComprovanteFailed) {
                  return const SizedBox();
                }

                return ValidarButtonWidget(book: widget.book);
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
