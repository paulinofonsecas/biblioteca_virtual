part of 'validate_payment_bloc.dart';

/// {@template validate_payment_state}
/// ValidatePaymentState description
/// {@endtemplate}
class ValidatePaymentState extends Equatable {
  /// {@macro validate_payment_state}
  const ValidatePaymentState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ValidatePaymentState with property changes
  ValidatePaymentState copyWith({
    String? customProperty,
  }) {
    return ValidatePaymentState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template validate_payment_initial}
/// The initial state of ValidatePaymentState
/// {@endtemplate}
class ValidatePaymentInitial extends ValidatePaymentState {
  /// {@macro validate_payment_initial}
  const ValidatePaymentInitial() : super();
}
