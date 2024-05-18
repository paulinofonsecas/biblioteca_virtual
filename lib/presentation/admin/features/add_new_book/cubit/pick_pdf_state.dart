part of 'pick_pdf_cubit.dart';

sealed class PickPDFState extends Equatable {
  const PickPDFState(this.path);

  final String? path;

  @override
  List<Object> get props => [path!];
}

final class PickPDFInitial extends PickPDFState {
  const PickPDFInitial() : super('');
}

final class PickPDFError extends PickPDFState {
  const PickPDFError(this.message) : super('');

  final String message;

  @override
  List<Object> get props => [message];
}

final class PickPDFSuccess extends PickPDFState {
  const PickPDFSuccess(super.path);
}
