import 'package:technical_test/screens/pokemon/domain/use_cases/get_pokemon_use_case.dart';

import 'get_pokemon_details_use_case.dart';

class PokemonUseCases {
  final GetPokemonUseCase getPokemonUseCase;
  final GetPokemonDetailsUseCase getPokemonDetailsUseCase;

  PokemonUseCases({required this.getPokemonDetailsUseCase, required this.getPokemonUseCase});
}
