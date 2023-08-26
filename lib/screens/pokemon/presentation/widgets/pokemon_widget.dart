import 'package:technical_test/screens/pokemon/domain/entities/pokemon_entity.dart';

import '../../../../core/core_importer.dart';
import 'pokemon_image.dart';

class PokemonWidget extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 1, offset: const Offset(3, 5))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PokemonImage(tag: pokemon.name, pokemonUrl: pokemon.url),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(pokemon.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
