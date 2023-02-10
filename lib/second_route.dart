import '../description_page.dart';
import '../pokemon.dart';
import 'package:flutter/material.dart';

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
      .map((e) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DescriptionPokemon(
                          pokemon: e,
                        )),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: 164,
                  height: 164,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color:
                        const Color.fromARGB(255, 221, 146, 6).withOpacity(0.7),
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
                            fontSize: 25,
                            color: Color.fromARGB(255, 63, 62, 62)),
                      ),
                    ],
                  )),
            ),
          ))
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
//https://stackoverflow.com/questions/48927928/how-to-add-clear-button-to-textfield-widget