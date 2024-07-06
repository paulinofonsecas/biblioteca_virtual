import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/carregar_comprovante_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/validar_comprovativo_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/widgets/validate_payment_body.dart';
import 'package:flutter/material.dart';

/// {@template validate_payment_page}
/// A description for ValidatePaymentPage
/// {@endtemplate}
class ValidatePaymentPage extends StatefulWidget {
  /// {@macro validate_payment_page}
  const ValidatePaymentPage({super.key});

  /// The static route for ValidatePaymentPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ValidatePaymentPage(),
    );
  }

  @override
  State<ValidatePaymentPage> createState() => _ValidatePaymentPageState();
}

class _ValidatePaymentPageState extends State<ValidatePaymentPage> {
  @override
  void initState() {
    getIt.registerSingleton(CarregarComprovanteCubit());
    super.initState();
  }

  @override
  void dispose() {
    getIt.unregister<CarregarComprovanteCubit>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ValidatePaymentBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<CarregarComprovanteCubit>(),
        ),
        BlocProvider(
          create: (context) => ValidarComprovativoCubit(),
        ),
      ],
      child: const Scaffold(
        body: ValidatePaymentView(),
      ),
    );
  }
}

/// {@template validate_payment_view}
/// Displays the Body of ValidatePaymentView
/// {@endtemplate}
class ValidatePaymentView extends StatelessWidget {
  /// {@macro validate_payment_view}
  const ValidatePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ValidatePaymentBody();
  }
}
