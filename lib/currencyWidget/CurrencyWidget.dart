import 'package:currency_converter/currencyWidget/model/CurrencyConverterModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'CurrencySelector.dart';

class CurrencyWidget extends StatelessWidget {
  final bool top;
  late final String symbol;
  late final double value;

  CurrencyWidget({Key? key, required this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widgetList = getChildrenWidgets(context);
    return new Container(
      child: new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: new Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    this.top ? widgetList : List.from(widgetList.reversed))),
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

  getChildrenWidgets(BuildContext context) {
    CurrencyConverterModel currency = Provider.of<CurrencyConverterModel>(context);
    var type = this.top ? "origin" : "target";
    var symbol = this.top ? currency.from : currency.to;
    var name = this.top ? currency.from : currency.to;
    var value = this.top ? currency.originalValue : currency.convertedValue;
    var textEditing = new TextEditingController();
    textEditing.text = value.toStringAsFixed(2);
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text("$symbol $name"),
          CurrencySelector(type: type),
        ],
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text("$symbol ", style: TextStyle(fontSize: 30)),
            Expanded(
              child: Focus(
                child: TextField(// do stuff
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,

                    ),
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w100,
                      color: Colors.purpleAccent
                    ),
                    controller: textEditing,
                    onSubmitted: (value) => changeValue(value, currency),
                    onChanged: (value) => textEditing.value = textEditing.value.copyWith(
                        text: value,
                        selection: TextSelection(
                            baseOffset: value.length,
                            extentOffset: value.length
                        )
                    )
                ),
                onFocusChange: (onFocus) {
                  if(!onFocus) {
                    changeValue(textEditing.text, currency);
                  }
                },
              )
            )
          ]
      )
    ];
  }

  changeValue(String value, CurrencyConverterModel currency) {
    if (this.top) {
      currency.originalValue = double.parse(value);
    } else {
      currency.convertedValue = double.parse(value);
    }
  }
}
