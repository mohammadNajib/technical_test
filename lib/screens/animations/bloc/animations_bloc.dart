import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/screens/animations/polygons.dart';

part 'animations_event.dart';
part 'animations_state.dart';

class AnimationsBloc extends Bloc<AnimationsEvent, AnimationsState> {
  AnimationsBloc() : super(const AnimationsInitial()) {
    on<AnimationsEvent>((event, emit) {
      event.handle(emit: emit);
    });
  }
}
