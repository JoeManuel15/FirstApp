import 'package:flutter/material.dart';
import '../description_page.dart';

class Pokemon {
  String number, name, image, description;
  Pokemon(
      {required this.number,
      required this.name,
      required this.image,
      required this.description});
}

List<Pokemon> pokemons = [
  Pokemon(
      number: "N.º 0001",
      name: "Bulbasaur",
      image: "images/001.png",
      description:
          "Este Pokémon nace con una semilla en el lomo, que brota con el paso del tiempo."),
  Pokemon(
      number: "N.º 0002",
      name: "Ivysaur",
      image: "images/002.png",
      description:
          "Cuando le crece bastante el bulbo del lomo, pierde la capacidad de erguirse sobre las patas traseras."),
  Pokemon(
      number: "N.º 0003",
      name: "Venusaur",
      image: "images/003.png",
      description:
          "La planta florece cuando absorbe energía solar, lo cual le obliga a buscar siempre la luz del sol."),
  Pokemon(
      number: "N.º 0004",
      name: "Charmander",
      image: "images/004.png",
      description:
          "Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola."),
  Pokemon(
      number: "N.º 0005",
      name: "Charmeleon",
      image: "images/005.png",
      description:
          "Este Pokémon de naturaleza agresiva ataca en combate con su cola llameante y hace trizas al rival con sus afiladas garras."),
  Pokemon(
      number: "N.º 0006",
      name: "Charizard",
      image: "images/006.png",
      description:
          "Escupe un fuego tan caliente que funde las rocas. Causa incendios forestales sin querer."),
  Pokemon(
      number: "N.º 0007",
      name: "Squirtle",
      image: "images/007.png",
      description:
          "Cuando retrae su largo cuello en el caparazón, dispara agua a una presión increíble."),
  Pokemon(
      number: "N.º 0008",
      name: "Wartortle",
      image: "images/008.png",
      description:
          "Se lo considera un símbolo de longevidad. Los ejemplares más ancianos tienen musgo sobre el caparazón."),
  Pokemon(
      number: "N.º 0009",
      name: "Blastoise",
      image: "images/009.png",
      description:
          "Para acabar con su enemigo, lo aplasta con el peso de su cuerpo. En momentos de apuro, se esconde en el caparazón."),
];

Widget pokemosCard(BuildContext context, List<Pokemon> listPokemons) {
  List<Widget> content = listPokemons
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
