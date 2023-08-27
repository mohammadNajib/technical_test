import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/screens/animations/polygons.dart';

import '../../../core/core_importer.dart';

part 'animations_event.dart';
part 'animations_state.dart';

class AnimationsBloc extends Bloc<AnimationsEvent, AnimationsState> {
  AnimationsBloc() : super(const AnimationsInitial()) {
    on<AnimationsEvent>((event, emit) {
      event.handle(emit: emit);
    });
  }
}
