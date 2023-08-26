import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/screens/home/bloc/home_bloc.dart';
import 'package:technical_test/screens/splash_screen.dart';

import 'injection_container.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: MaterialApp(
        title: 'Technical Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const SplashScreen(),
      ),
    );
  }
}
