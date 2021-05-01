import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/CurrencyConverterModel.dart';

class CurrencySelector extends StatelessWidget{

  final String type;

  const CurrencySelector({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrencyConverterModel currency = Provider.of<CurrencyConverterModel>(context);
    return DropdownButton<String>(
      value: this.type == "origin" ? currency.from : currency.to,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (value) {
        if (this.type == "origin") {
          currency.from = value!;
        } else {
          currency.to = value!;
        }
      },
      items: currency.listOfCurrencies.keys.toList()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}