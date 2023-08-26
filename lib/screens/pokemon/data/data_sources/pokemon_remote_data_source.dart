import 'package:technical_test/screens/pokemon/data/models/pokemon_list_model.dart';

import '../../../../core/core_importer.dart';
import '../models/pokemon_details_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonsListModel> getPokemon({required int offset});
  Future<PokemonDetailsModel> getPokemonDetails({required String url});
}

class PokemonRemoteDataSourceImplement implements PokemonRemoteDataSource {
  @override
  Future<PokemonsListModel> getPokemon({required int offset}) async {
    Map<String, dynamic> param = {'offset': offset, 'limit': 20};
    Response? response =
        await ApiProvider.sendRequest(url: '/api/v2/pokemon/', method: HttpMethods.get, queryParameters: param);
    try {
      if (response != null) {
        if (response.statusCode == successCode) return pokemonsListModelFromJson(jsonEncode(response.data));
      }
    } catch (e) {
      throw (InternalException(message: e.toString()));
    }
    throw (ServerException());
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetails({required String url}) async {
    Response? response =
        await ApiProvider.sendRequest(url: url.replaceAll('https://pokeapi.co', ''), method: HttpMethods.get);
    try {
      if (response != null) {
        if (response.statusCode == successCode) return pokemonDetailsModelFromJson(jsonEncode(response.data));
      }
    } catch (e) {
      throw (InternalException(message: e.toString()));
    }
    throw (ServerException());
  }
}
