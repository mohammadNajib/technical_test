import 'package:dartz/dartz.dart';
import 'package:technical_test/core/core_importer.dart';
import 'package:technical_test/screens/pokemon/domain/entities/pokemon_details_entity.dart';
import 'package:technical_test/screens/pokemon/domain/entities/pokemon_list_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonListEntity>> getPokemon({required int offset});
  Future<Either<Failure, PokemonDetailsEntity>> getPokemonDetails({required String url});
}
