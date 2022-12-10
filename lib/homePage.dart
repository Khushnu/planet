// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _planetWeight = TextEditingController();
  var radioValue = 0;
  double _result = 0;
  String _format = "";

  void handleValueChanged(var value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _result = _calculate(_planetWeight.text, 0.38);
          _format = "Your Weight on Mars ${_result.toStringAsFixed(1)} ";
          break;
        case 1:
          _result = _calculate(_planetWeight.text, 0.06);
          _format = "Your Weight on Pluto ${_result.toStringAsFixed(1)} ";
          break;
        case 2:
          _result = _calculate(_planetWeight.text, 0.91);
          _format = "Your Weight on Venus ${_result.toStringAsFixed(1)} ";
          break;
        case 3:
          _planetWeight.clear();
          _format = "";
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          "Planet On Wieght",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: ListView(padding: EdgeInsets.all(10.0), children: [
          Image.asset(
            'lib/images/planet.png',
            height: 200,
          ),
          Container(
            child: Column(
              children: [
                TextField(
                  controller: _planetWeight,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text('Your Weight On Planet'),
                      hintText: 'In Pound'),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          activeColor: Colors.red,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleValueChanged),
                      Text("Mars"),
                      Radio(
                          activeColor: Colors.brown,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleValueChanged),
                      Text("Pluto"),
                      Radio(
                          activeColor: Colors.amberAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleValueChanged),
                      Text("Venus"),
                      Radio(
                          activeColor: Colors.purpleAccent,
                          value: 3,
                          groupValue: radioValue,
                          onChanged: handleValueChanged),
                      Text("Clear")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(9),
                  child: SizedBox(
                    child: Text(
                      "$_format",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  _calculate(String weight, double multi) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multi;
    } else {
      print("Wrong");
    }
  }
}
