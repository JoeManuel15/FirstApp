import 'package:flutter/material.dart';

class Pokemon {
  String number, name, image;
  Pokemon({required this.number, required this.name, required this.image});
}

List<Pokemon> pokemons = [
  Pokemon(number: "N.º 0001", name: "Bulbasaur", image: "images/001.png"),
  Pokemon(number: "N.º 0002", name: "Ivysaur", image: "images/002.png"),
  Pokemon(number: "N.º 0003", name: "Venusaur", image: "images/003.png"),
  Pokemon(number: "N.º 0004", name: "Charmander", image: "images/004.png"),
  Pokemon(number: "N.º 0005", name: "Charmeleon", image: "images/005.png"),
  Pokemon(number: "N.º 0006", name: "Charizard", image: "images/006.png"),
  Pokemon(number: "N.º 0007", name: "Squirtle", image: "images/007.png"),
  Pokemon(number: "N.º 0008", name: "Wartortle", image: "images/008.png"),
  Pokemon(number: "N.º 0009", name: "Blastoise", image: "images/009.png"),
];

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

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
        body: pokemosCard(context));
  }
}

Widget pokemosCard(BuildContext context) {
  List<Widget> content = pokemons
      .map(
        (e) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              width: 164,
              height: 164,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(255, 221, 146, 6).withOpacity(0.7),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        e.number.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 63, 62, 62),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(e.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    e.name,
                    style: const TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 63, 62, 62)),
                  ),
                ],
              )),
        ),
      )
      .toList();
  return ListView(
    children: [
      Align(
        alignment: Alignment.center,
        child: Wrap(
          children: content,
        ),
      ),
    ],
  );
  //Wrap(direction: Axis.vertical, children: content);
}

// Search Page
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}
