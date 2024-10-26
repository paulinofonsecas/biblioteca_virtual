part of 'animated_container_cubit.dart';

sealed class AnimatedContainerState extends Equatable {
  const AnimatedContainerState();

  @override
  List<Object> get props => [];
}

final class AnimatedContainerInitial extends AnimatedContainerState {}
final class ChangeContainerColor extends AnimatedContainerState {}
