part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  handle({required Function(HomeState) emit});
}

class ChangeNameEvent extends HomeEvent {
  final String name;

  const ChangeNameEvent({required this.name});

  @override
  List<Object> get props => [name];

  @override
  handle({required Function(HomeState) emit}) {
    emit(NameTextState(name: name));
  }
}

class ClearNameEvent extends HomeEvent {
  const ClearNameEvent();

  @override
  List<Object> get props => [];

  @override
  handle({required Function(HomeState) emit}) {
    emit(HomeInitial());
  }
}
