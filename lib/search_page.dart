import 'package:flutter/material.dart';
import '../pokemon.dart';

// Search Page
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchPage> {
  final _controller = TextEditingController();
  List<Pokemon> searchPokemons = [];

  @override
  void initState() {
    super.initState();
    searchPokemons = pokemons;
  }

  void filter(String inputString) {
    searchPokemons = pokemons
        .where((i) => i.name.toLowerCase().contains(inputString))
        .toList();
    setState(() {});
  }

  void clearFilter() {
    searchPokemons = pokemons;
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            controller: _controller,
            onChanged: (text) {
              text = text.toLowerCase();
              filter(text);
            },
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                    icon: const Icon(Icons.clear), onPressed: clearFilter),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
      body: pokemosCard(context, searchPokemons),
    );
  }
}
