import 'package:dartz/dartz.dart' as datz;
import 'package:image_fade/image_fade.dart';

import '../../../../core/core_importer.dart';
import '../bloc/pokemon_bloc.dart';

class PokemonImage extends StatefulWidget {
  final Object tag;
  final String pokemonUrl;

  const PokemonImage({Key? key, required this.tag, required this.pokemonUrl}) : super(key: key);

  @override
  PokemonImageState createState() => PokemonImageState();
}

class PokemonImageState extends State<PokemonImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.width / 3,
        child: Hero(
          tag: widget.tag,
          child: FutureBuilder(
              future: fetchPokemonImageUrl(pokemonUrl: widget.pokemonUrl),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting || snapshot.hasError) {
                  return const Image(image: AssetImage('assets/poke_ball.jpg'));
                } else if (snapshot.hasData && snapshot.data != null) {
                  return ImageFade(
                    image: NetworkImage(snapshot.data!),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    errorBuilder: (context, obj) => const Image(image: AssetImage('assets/poke_ball.jpg')),
                    placeholder: const Image(image: AssetImage('assets/poke_ball.jpg')),
                    fit: BoxFit.contain,
                  );
                } else {
                  return const Image(image: AssetImage('assets/poke_ball.jpg'));
                }
              }),
        ),
      ),
    );
  }

  Future<String?> fetchPokemonImageUrl({required String pokemonUrl}) async {
    try {
      datz.Either either = await sl<PokemonBloc>().pokemonUseCases.getPokemonDetailsUseCase(url: pokemonUrl);
      either.fold((failure) => null, (details) {
        return details.sprites.frontDefault;
      });
      return null;
    } catch (e) {
      return null;
    }
  }
}
