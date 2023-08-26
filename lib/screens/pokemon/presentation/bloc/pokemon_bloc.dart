import 'package:dartz/dartz.dart';
import 'package:technical_test/screens/pokemon/domain/entities/pokemon_list_entity.dart';

import '../../../../core/core_importer.dart';
import '../../domain/use_cases/pokemon_use_cases.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonUseCases pokemonUseCases;
  PokemonBloc({required this.pokemonUseCases}) : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      await event.handle(emit: emit, useCase: pokemonUseCases);
    });
  }
}
