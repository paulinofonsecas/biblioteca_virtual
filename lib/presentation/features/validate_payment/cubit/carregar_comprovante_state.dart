part of 'carregar_comprovante_cubit.dart';

sealed class CarregarComprovanteState extends Equatable {
  const CarregarComprovanteState();

  @override
  List<Object> get props => [];
}

final class CarregarComprovanteInitial extends CarregarComprovanteState {}

final class CarregarComprovanteLoading extends CarregarComprovanteState {}

final class CarregarComprovanteFailed extends CarregarComprovanteState {}

final class CarregarComprovanteWrongFileType extends CarregarComprovanteState {}

final class CarregarComprovanteLoaded extends CarregarComprovanteState {
  const CarregarComprovanteLoaded({required this.path});
  final String path;

  @override
  List<Object> get props => [path];
}
