import 'package:flutter/material.dart';

import 'bloc/animations_bloc.dart';

enum Polygons {
  sharpSquare(color: Colors.blue, radius: 0, event: AnimateToSharpSquareEvent()),
  softSquare(color: Colors.cyan, radius: 15, event: AnimateToSoftSquareEvent()),
  circle(color: Colors.redAccent, radius: 90, event: AnimateToCircleEvent());

  final Color color;
  final double radius;
  final AnimationsEvent event;

  const Polygons({required this.color, required this.radius, required this.event});
}
