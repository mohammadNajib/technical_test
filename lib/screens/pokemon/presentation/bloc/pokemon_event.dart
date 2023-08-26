part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  handle({required Function(PokemonState) emit, required PokemonUseCases useCase});
}

class GetPokemonEvent extends PokemonEvent {
  final int offset;

  const GetPokemonEvent({required this.offset});

  @override
  List<Object?> get props => [];

  @override
  handle({required Function(PokemonState) emit, required PokemonUseCases useCase}) async {
    emit(LoadingPokemonsState());
    Either either = await useCase.getPokemonUseCase(offset: offset);
    either.fold((failure) => emit(ErrorPokemonState(message: failure!.message ?? 'error')), (pokemon) {
      emit(LoadedPokemonState(pokemon: pokemon));
    });
  }
}
