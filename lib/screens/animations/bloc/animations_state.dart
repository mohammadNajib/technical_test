part of 'animations_bloc.dart';

@immutable
abstract class AnimationsState extends Equatable {
  final Polygons polygons;

  const AnimationsState({required this.polygons});
}

class AnimationsInitial extends AnimationsState {
  const AnimationsInitial({super.polygons = Polygons.sharpSquare});

  @override
  List<Object> get props => [];
}

class SharpSquareState extends AnimationsState {
  const SharpSquareState({super.polygons = Polygons.sharpSquare});

  @override
  List<Object> get props => [];
}

class SoftSquareState extends AnimationsState {
  const SoftSquareState({super.polygons = Polygons.softSquare});

  @override
  List<Object> get props => [];
}

class CircleState extends AnimationsState {
  const CircleState({super.polygons = Polygons.circle});

  @override
  List<Object> get props => [];
}
