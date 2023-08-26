import 'package:technical_test/screens/pokemon/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({name, url}) : super(name: name, url: url);

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
