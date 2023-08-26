import 'dart:convert';

import 'package:technical_test/screens/pokemon/domain/entities/pokemon_details_entity.dart';

PokemonDetailsModel pokemonDetailsModelFromJson(String str) => PokemonDetailsModel.fromJson(json.decode(str));

class PokemonDetailsModel extends PokemonDetailsEntity {
  PokemonDetailsModel({required sprites}) : super(sprites: sprites);

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(sprites: SpritesModel.fromJson(json["sprites"]));
}

class SpritesModel extends SpritesEntity {
  SpritesModel({required frontDefault}) : super(frontDefault: frontDefault);

  factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(frontDefault: json["front_default"]);

  Map<String, dynamic> toJson() => {"front_default": frontDefault};
}
