import 'package:get_it/get_it.dart';
import 'package:technical_test/screens/home/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HomeBloc());
}
