import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/validar_comprovativo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ValidarButtonWidget extends StatelessWidget {
  const ValidarButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidarComprovativoCubit, ValidarComprovativoState>(
      builder: (context, state) {
        if (state is ValidarComprovativoLoading) {
          return const CircularProgressIndicator();
        }

        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.amber,
            ),
          ),
          child: FilledButton(
            onPressed: () {
              context.read<ValidarComprovativoCubit>().validar();
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GutterSmall(),
                Text('Validar pagamento'),
                GutterSmall(),
              ],
            ),
          ),
        );
      },
    );
  }
}
