// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void Convert() {
    setState(() {
      input = double.parse(controllerUser.text);
      kelvin = input + 273.15;
      reamur = (4 / 5 * input);
      fahrenheit = (9 / 5 * input) + 32;
    });
  }

  double input = 0;
  double kelvin = 0, reamur = 0, fahrenheit = 0;
  final controllerUser = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Converter Suhu"),
        ),
        body: ListView(
          children: [
            Input(controllerUser: controllerUser),
            View(fahrenheit: fahrenheit, reamur: reamur, kelvin: kelvin),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(
                    40), // fromHeight use double.infinity as width and 40 is the height
              ),
              onPressed: Convert,
              child: const Text('Convert'),
            )
          ],
        ),
      ),
    );
  }
}

class View extends StatelessWidget {
  const View({
    Key? key,
    required this.fahrenheit,
    required this.reamur,
    required this.kelvin,
  }) : super(key: key);

  final double fahrenheit;
  final double reamur;
  final double kelvin;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 390,
        width: 290,
        alignment: Alignment.topCenter,
        child: Text('Fahrenheit : ' '$fahrenheit'),
      ),
      Container(
        height: 390,
        width: 290,
        alignment: Alignment.topCenter,
        child: Text('Reamur : ' '$reamur'),
      ),
      Container(
        height: 390,
        width: 290,
        alignment: Alignment.topCenter,
        child: Text('Kelvin : ' '$kelvin'),
      ),
    ]);
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.controllerUser,
  }) : super(key: key);

  final TextEditingController controllerUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Masukkan Suhu',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: controllerUser,
        ),
      ]),
    );
  }
}
