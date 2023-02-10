import '../pokemon.dart';
import 'package:flutter/material.dart';

// Description Page
class DescriptionPokemon extends StatelessWidget {
  const DescriptionPokemon({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(pokemon.name),
          backgroundColor: const Color.fromARGB(255, 199, 86, 34),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Container(
              width: 364,
              height: 364,
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
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        pokemon.number,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 63, 62, 62),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 180.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(pokemon.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 63, 62, 62)),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      pokemon.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 63, 62, 62)),
                    ),
                  )
                ],
              )),
        ));
  }
}
