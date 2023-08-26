import 'package:dartz/dartz.dart';

import 'package:technical_test/screens/pokemon/data/data_sources/pokemon_remote_data_source.dart';
import 'package:technical_test/screens/pokemon/domain/entities/pokemon_details_entity.dart';

import 'package:technical_test/screens/pokemon/domain/entities/pokemon_list_entity.dart';

import '../../../../core/core_importer.dart';
import '../../domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplement implements PokemonRepository {
  final PokemonRemoteDataSource pokemonRemoteDataSource;

  PokemonRepositoryImplement({required this.pokemonRemoteDataSource});
  @override
  Future<Either<Failure, PokemonListEntity>> getPokemon({required int offset}) async {
    try {
      PokemonListEntity pokemon = await pokemonRemoteDataSource.getPokemon(offset: offset);
      return Right(pokemon);
    } on CacheException {
      return Left(CacheFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on OfflineException {
      return Left(OfflineFailure());
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonDetailsEntity>> getPokemonDetails({required String url}) async {
    try {
      PokemonDetailsEntity pokemon = await pokemonRemoteDataSource.getPokemonDetails(url: url);
      return Right(pokemon);
    } on CacheException {
      return Left(CacheFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on OfflineException {
      return Left(OfflineFailure());
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }
}
