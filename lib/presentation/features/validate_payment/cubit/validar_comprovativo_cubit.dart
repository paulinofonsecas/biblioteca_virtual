import 'dart:io';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/carregar_comprovante_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:verify_payment/models/response_model.dart';
import 'package:verify_payment/verify_payment.dart';

part 'validar_comprovativo_state.dart';

class ValidarComprovativoCubit extends Cubit<ValidarComprovativoState> {
  ValidarComprovativoCubit() : super(ValidarComprovativoInitial());

  Future<void> validar() async {
    emit(ValidarComprovativoLoading());
    final comprovativoState = getIt<CarregarComprovanteCubit>().state;

    if (comprovativoState is! CarregarComprovanteLoaded) {
      const ValidarComprovativoError(
        message: 'Erro ao processar o comprovativo. Tente novamente',
      );
      return;
    }

    final comprovativoPath = comprovativoState.path;

    final file = File(comprovativoPath);
    final result = await verifyPayment(file);

    if (result is VerifyPaymentSuccess) {
      emit(ValidarComprovativoSuccess(result: result));
    } else {
      emit(
        const ValidarComprovativoError(
          message: 'Erro ao validar o comprovativo',
        ),
      );
    }
  }
}
