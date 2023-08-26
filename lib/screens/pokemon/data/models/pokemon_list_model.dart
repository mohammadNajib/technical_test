import 'dart:convert';

import 'package:technical_test/screens/pokemon/data/models/pokemon_model.dart';
import 'package:technical_test/screens/pokemon/domain/entities/pokemon_list_entity.dart';

PokemonsListModel pokemonsListModelFromJson(String str) => PokemonsListModel.fromJson(json.decode(str));

class PokemonsListModel extends PokemonListEntity {
  const PokemonsListModel({count, next, previous, pokemons})
      : super(count: count, next: next, previous: previous, pokemons: pokemons);

  factory PokemonsListModel.fromJson(Map<String, dynamic> json) => PokemonsListModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        pokemons: List<PokemonModel>.from(json["results"].map((x) => PokemonModel.fromJson(x))),
      );
}
