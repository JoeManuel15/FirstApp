import 'second_route.dart';
import 'package:flutter/material.dart';
import 'package:shirne_dialog/shirne_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/tierra.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              //padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromARGB(255, 233, 233, 233)
                        .withOpacity(0.7),
                  ),
                  child: Flex(direction: Axis.vertical, children: <Widget>[
                    Form(
                      key: _key,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 10),
                            const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 63, 62, 62)),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 100, 100, 100),
                                        width: 2.0),
                                  ),
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.email),
                                  hintText: 'E-Mail',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "E-Mail no invalido";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 100, 100, 100),
                                        width: 2.0),
                                  ),
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.password),
                                  hintText: 'Contraseña',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Contraseña no valida";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      MyDialog.of(context).toast('Oky',
                                          style: MyDialog.theme.toastStyle
                                              ?.bottom());
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SecondRoute()),
                                      );
                                    }
                                  },
                                  child: const Text("Start")),
                            )
                          ]),
                    )
                  ])),
            )
          ],
        ));
  }
}
