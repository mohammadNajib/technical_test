import 'package:dartz/dartz.dart';
import 'package:technical_test/screens/pokemon/domain/repositories/pokemon_repository.dart';

import '../../../../core/core_importer.dart';
import '../entities/pokemon_list_entity.dart';

class GetPokemonUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonUseCase({required this.pokemonRepository});

  Future<Either<Failure, PokemonListEntity>> call({required int offset}) async {
    return await pokemonRepository.getPokemon(offset: offset);
  }
}
