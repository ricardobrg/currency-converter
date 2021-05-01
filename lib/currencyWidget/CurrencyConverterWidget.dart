import 'package:currency_converter/network/CurrencyNetwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'CurrencyWidget.dart';

/// The Currency Converter Widget
class CurrencyConverterWidget extends StatelessWidget {
  final CurrencyNetwork api;

  CurrencyConverterWidget({Key? key, required this.api}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CurrencyWidget(
            top: true,
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



