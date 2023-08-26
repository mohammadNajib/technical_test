part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonInitial extends PokemonState {
  @override
  List<Object> get props => [];
}

class LoadingPokemonsState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class LoadedPokemonState extends PokemonState {
  final PokemonListEntity pokemon;

  const LoadedPokemonState({required this.pokemon});

  @override
  List<Object> get props => [pokemon];
}

class ErrorPokemonState extends PokemonState {
  final String message;

  const ErrorPokemonState({required this.message});

  @override
  List<Object> get props => [message];
}
