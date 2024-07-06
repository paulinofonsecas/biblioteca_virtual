import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'validate_payment_event.dart';
part 'validate_payment_state.dart';

class ValidatePaymentBloc extends Bloc<ValidatePaymentEvent, ValidatePaymentState> {
  ValidatePaymentBloc() : super(const ValidatePaymentInitial()) {
    on<CustomValidatePaymentEvent>(_onCustomValidatePaymentEvent);
  }

  FutureOr<void> _onCustomValidatePaymentEvent(
    CustomValidatePaymentEvent event,
    Emitter<ValidatePaymentState> emit,
  ) {
    // TODO: Add Logic
  }
}
