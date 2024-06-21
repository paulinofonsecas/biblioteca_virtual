part of 'pick_image_cubit.dart';

sealed class PickImageState extends Equatable {
  const PickImageState(this.path);

  final String? path;

  @override
  List<Object> get props => [path!];
}

final class PickImageInitial extends PickImageState {
  const PickImageInitial() : super('');
}

final class PickImageError extends PickImageState {
  const PickImageError(this.message) : super('');

  final String message;

  @override
  List<Object> get props => [message];
}

final class PickImageSuccess extends PickImageState {
  const PickImageSuccess(super.path);
}
