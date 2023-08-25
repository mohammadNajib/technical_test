part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class NameTextState extends HomeState {
  final String name;

  const NameTextState({required this.name});

  @override
  List<Object> get props => [name];
}
