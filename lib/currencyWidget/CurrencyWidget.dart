import 'package:currency_converter/currencyWidget/model/CurrencyConverterModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'CurrencySelector.dart';

class CurrencyWidget extends StatelessWidget {
  final bool top;
  final String currency;
  final String symbol;
  final double value;

  const CurrencyWidget(
      {Key? key,
        required this.top,
        required this.currency,
        required this.symbol,
        required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currency = context.watch<CurrencyConverterModel>();
    var widgetList = getChildrenWigets(currency);
    return new Container(
      child: new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.symmetric(vertical:8, horizontal: 16),
        child: new Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: this.top ?
                widgetList :
                List.from(widgetList.reversed)
            )
        ),
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Color.fromARGB(20, 20, 20, 20),
            blurRadius: 100.0,
          ),
        ],
      ),
    );
  }

  getChildrenWigets(CurrencyConverterModel currency) {
    var type = this.top ? "origin" : "target";
    var symbol = this.top ? currency.from : currency.to;
    var name = this.top ? currency.from : currency.to;
    var value = this.top ? currency.originalValue : currency.convertedValue;
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline ,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text("$symbol $name"),
          CurrencySelector(type: type),
        ],
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.baseline ,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text("$symbol ", style: TextStyle(fontSize: 30)),
            Text(value.toStringAsFixed(2), style: TextStyle(fontSize: 60))
          ]
      )
    ];
  }


}