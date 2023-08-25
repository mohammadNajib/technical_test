import 'package:flutter/material.dart';

import '../animations/animations_page.dart';

enum HomeButton {
  page1(text: 'Go to page 1', route: AnimationsPage(), color: Colors.blue),
  page2(text: 'Go to page 2', route: AnimationsPage(), color: Colors.cyan);

  final String text;
  final Color color;
  final Widget route;

  const HomeButton({required this.text, required this.color, required this.route});
}
