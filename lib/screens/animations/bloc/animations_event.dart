part of 'animations_bloc.dart';

@immutable
abstract class AnimationsEvent extends Equatable {
  const AnimationsEvent();

  handle({required Function(AnimationsState) emit});
}

class AnimateToSharpSquareEvent extends AnimationsEvent {
  const AnimateToSharpSquareEvent();

  @override
  List<Object> get props => [];

  @override
  handle({required Function(AnimationsState) emit}) {
    emit(const SharpSquareState());
  }
}

class AnimateToSoftSquareEvent extends AnimationsEvent {
  const AnimateToSoftSquareEvent();

  @override
  List<Object> get props => [];

  @override
  handle({required Function(AnimationsState) emit}) {
    emit(const SoftSquareState());
  }
}

class AnimateToCircleEvent extends AnimationsEvent {
  const AnimateToCircleEvent();

  @override
  List<Object> get props => [];

  @override
  handle({required Function(AnimationsState) emit}) {
    emit(const CircleState());
  }
}
