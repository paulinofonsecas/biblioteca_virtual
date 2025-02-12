import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/carregar_comprovante_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/validar_comprovativo_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/widgets/file_picker_button.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/widgets/success_validation_alert_dialog.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/widgets/validar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class VerifyPaymentActions extends StatefulWidget {
  const VerifyPaymentActions(this.book, {super.key});

  final BookModel book;

  @override
  State<VerifyPaymentActions> createState() => _VerifyPaymentActionsState();
}

class _VerifyPaymentActionsState extends State<VerifyPaymentActions> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidarComprovativoCubit, ValidarComprovativoState>(
      listener: (context, state) {
        if (state is ValidarComprovativoSuccess) {
          showDialog(
            context: context,
            builder: (context) => SuccessValidationAlertDialog(
              state: state.result,
              book: widget.book,
            ),
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
            const FilePickerButton(),
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
