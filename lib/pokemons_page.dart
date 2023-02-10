import '../pokemon.dart';
import '../search_page.dart';
import 'package:flutter/material.dart';

// Pokemons Page
class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pokedex'),
          backgroundColor: const Color.fromARGB(255, 199, 86, 34),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
            ),
          ],
        ),
        body: pokemosCard(context, pokemons));
  }
}
