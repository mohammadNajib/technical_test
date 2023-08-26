import 'package:flutter/material.dart';
import 'package:technical_test/screens/pokemon/presentation/pages/pokemon_page.dart';

import '../animations/animations_page.dart';

enum HomeButton {
  page1(text: 'Go to page 1', route: AnimationsPage(), color: Colors.blue),
  page2(text: 'Go to page 2', route: PokemonPage(), color: Colors.cyan);

  final String text;
  final Color color;
  final Widget route;

  const HomeButton({required this.text, required this.color, required this.route});
}
