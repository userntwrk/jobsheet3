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
      switch (_newValue) {
        case 'Kelvin':
          _result = input + 273.15;
          break;
        case 'Reamur':
          _result = (4 / 5 * input);
          break;
        case 'Fahrenheit':
          _result = (9 / 5 * input) + 32;
      }
    });
  }

  double input = 0;
  double kelvin = 0, reamur = 0, fahrenheit = 0;
  final controllerUser = TextEditingController();
  var listItem = ["Fahrenheit", "Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double _result = 0;
  List<String> listViewItem = <String>[];

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
            View(
              result: _result,
            ),
            DropdownButton<String>(
              items: listItem.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: _newValue,
              onChanged: (value) {
                setState(() {
                  _newValue = value!;
                  Convert();
                });
              },
            ),
            ListView.builder(listViewItem.map((String value) {
              return Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 15),
                  ));
            }).toList()),
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
  View({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hasil",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              result.toStringAsFixed(1),
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      )
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
