import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget{

  final String type;

  const CurrencySelector({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dropdownValue = "One";
    return DropdownButton<String>(
      value: dropdownValue = "One",
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (value) => print(value),
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}