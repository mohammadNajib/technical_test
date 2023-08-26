import 'package:get_it/get_it.dart';
import 'package:technical_test/screens/animations/bloc/animations_bloc.dart';
import 'package:technical_test/screens/home/bloc/home_bloc.dart';
import 'package:technical_test/screens/pokemon/data/repositories/pokemon_repository_implement.dart';
import 'package:technical_test/screens/pokemon/domain/use_cases/get_pokemon_use_case.dart';
import 'package:technical_test/screens/pokemon/domain/use_cases/pokemon_use_cases.dart';
import 'package:technical_test/screens/pokemon/presentation/bloc/pokemon_bloc.dart';

import 'screens/pokemon/data/data_sources/pokemon_remote_data_source.dart';
import 'screens/pokemon/domain/repositories/pokemon_repository.dart';
import 'screens/pokemon/domain/use_cases/get_pokemon_details_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HomeBloc());
  sl.registerFactory(() => AnimationsBloc());
  sl.registerFactory(() => PokemonBloc(pokemonUseCases: sl()));

  sl.registerLazySingleton(() => PokemonUseCases(getPokemonUseCase: sl(), getPokemonDetailsUseCase: sl()));
  sl.registerLazySingleton(() => GetPokemonUseCase(pokemonRepository: sl()));
  sl.registerLazySingleton(() => GetPokemonDetailsUseCase(pokemonRepository: sl()));

  sl.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImplement(pokemonRemoteDataSource: sl()));

  sl.registerLazySingleton<PokemonRemoteDataSource>(() => PokemonRemoteDataSourceImplement());
}
