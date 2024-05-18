part of 'resumo_input_cubit.dart';

sealed class ResumoInputState extends Equatable {
  const ResumoInputState(this.text);
  final String text;

  @override
  List<Object> get props => [text];
}

final class ResumoInputInitial extends ResumoInputState {
  const ResumoInputInitial() : super('');
}

final class ResumoInputTextChanged extends ResumoInputState {
  const ResumoInputTextChanged(super.text);
}
