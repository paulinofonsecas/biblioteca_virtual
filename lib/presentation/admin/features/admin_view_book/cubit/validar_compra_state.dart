part of 'validar_compra_cubit.dart';

sealed class ValidarCompraState extends Equatable {
  const ValidarCompraState();

  @override
  List<Object> get props => [];
}

final class ValidarCompraInitial extends ValidarCompraState {}

final class ValidarCompraPaymentLoading extends ValidarCompraState {}

final class ValidarCompraPaymentSuccess extends ValidarCompraState {
  const ValidarCompraPaymentSuccess(this.paymentDetails);

  final Payment paymentDetails;

  @override
  List<Object> get props => [paymentDetails];
}

final class ValidarCompraPaymentFailure extends ValidarCompraState {
  const ValidarCompraPaymentFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
