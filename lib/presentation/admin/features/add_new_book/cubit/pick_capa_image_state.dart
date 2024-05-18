part of 'pick_capa_image_cubit.dart';

sealed class PickCapaImageState extends Equatable {
  const PickCapaImageState(this.path);

  final String? path;

  @override
  List<Object> get props => [path!];
}

final class PickCapaImageInitial extends PickCapaImageState {
  const PickCapaImageInitial() : super('');
}

final class PickCapaImageError extends PickCapaImageState {
  const PickCapaImageError(this.message) : super('');

  final String message;

  @override
  List<Object> get props => [message];
}

final class PickCapaImageSuccess extends PickCapaImageState {
  const PickCapaImageSuccess(super.path);
}
