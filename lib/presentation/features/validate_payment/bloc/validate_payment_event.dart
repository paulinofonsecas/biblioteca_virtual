part of 'validate_payment_bloc.dart';

abstract class ValidatePaymentEvent  extends Equatable {
  const ValidatePaymentEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_validate_payment_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomValidatePaymentEvent extends ValidatePaymentEvent {
  /// {@macro custom_validate_payment_event}
  const CustomValidatePaymentEvent();
}
