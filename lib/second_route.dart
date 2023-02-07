import 'package:flutter/material.dart';

List<Pokemon> pokemons = [
  Pokemon(
      number: 0001,
      name: "Bulbasaur",
      image: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png"),
];

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pokedex'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SearchPage())),
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color.fromARGB(255, 233, 233, 233)
                          .withOpacity(0.7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(
                          pokemons[index].number.toString(),
                          style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 63, 62, 62)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          pokemons[index].name,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 63, 62, 62)),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/tierra.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Image.network(
                            "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    )));
          }),
    );
  }
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

class Pokemon {
  int number;
  String name, image;
  Pokemon({required this.number, required this.name, required this.image});
}
