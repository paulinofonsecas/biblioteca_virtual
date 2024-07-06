part of 'validar_comprovativo_cubit.dart';

sealed class ValidarComprovativoState extends Equatable {
  const ValidarComprovativoState();

  @override
  List<Object> get props => [];
}

final class ValidarComprovativoInitial extends ValidarComprovativoState {}

final class ValidarComprovativoLoading extends ValidarComprovativoState {}

final class ValidarComprovativoSuccess extends ValidarComprovativoState {
  const ValidarComprovativoSuccess({required this.result});

  final VerifyPaymentSuccess result;

  @override
  List<Object> get props => [result];
}

final class ValidarComprovativoError extends ValidarComprovativoState {
  const ValidarComprovativoError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
