import 'package:currency_converter/currencyWidget/model/CurrencyConverterModel.dart';
import 'package:currency_converter/network/CurrencyNetwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'CurrencyWidget.dart';

/// The Currency Converter Widget
class CurrencyConverterWidget extends StatelessWidget {
  final CurrencyNetwork api;

  CurrencyConverterWidget({Key? key, required this.api}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currency = Provider.of<CurrencyConverterModel>(context);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CurrencyWidget(
            top: true,
          ),
          ClipOval(
            child: MaterialButton(
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              onPressed: () => currency.changeValues(),
              child: Icon(
                Icons.compare_arrows
              )
            ),
          ),
          CurrencyWidget(
            top: false,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8)
    );
  }
}



