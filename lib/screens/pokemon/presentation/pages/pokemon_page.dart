import 'package:technical_test/screens/pokemon/presentation/bloc/pokemon_bloc.dart';

import '../../../../core/core_importer.dart';
import '../widgets/pokemon_widget.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonBloc>()..add(const GetPokemonEvent(offset: 0)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Pokemons', style: TextStyle(color: Colors.white, fontSize: 25)),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back), color: Colors.white, onPressed: () => Navigator.pop(context)),
        ),
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is LoadingPokemonsState) {
                  return const Center(child: CircularProgressIndicator(color: Colors.cyan));
                } else if (state is LoadedPokemonState) {
                  return ListView.builder(
                      itemCount: state.pokemon.pokemons.length,
                      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      itemBuilder: (context, index) {
                        return PokemonWidget(pokemon: state.pokemon.pokemons[index]);
                      });
                } else if (state is ErrorPokemonState) {
                  return Center(
                      child: Text(state.message, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
                }
                return const Center(child: CircularProgressIndicator(color: Colors.cyan));
              },
            ),
          ),
        ),
      ),
    );
  }
}
