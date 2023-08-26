import 'package:dartz/dartz.dart';
import 'package:technical_test/screens/pokemon/domain/repositories/pokemon_repository.dart';

import '../../../../core/core_importer.dart';
import '../entities/pokemon_details_entity.dart';

class GetPokemonDetailsUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonDetailsUseCase({required this.pokemonRepository});

  Future<Either<Failure, PokemonDetailsEntity>> call({required String url}) async {
    return await pokemonRepository.getPokemonDetails(url: url);
  }
}
