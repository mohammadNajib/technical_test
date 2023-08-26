import 'package:equatable/equatable.dart';
import 'package:technical_test/screens/pokemon/domain/entities/pokemon_entity.dart';

class PokemonListEntity extends Equatable {
  final int count;
  final String next;
  final String? previous;
  final List<PokemonEntity> pokemons;

  const PokemonListEntity({
    required this.count,
    required this.next,
    this.previous,
    required this.pokemons,
  });

  @override
  List<Object?> get props => [count, next, previous, pokemons];
}
