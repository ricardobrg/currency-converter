import 'dart:developer';

import 'package:currency_converter/currencyWidget/model/CurrencyConverterModel.dart';
import 'package:currency_converter/network/OpenRatesApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'currencyWidget/CurrencyConverterWidget.dart';

void main() {
  OpenRatesApi api = new OpenRatesApi();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CurrencyConverterModel()),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {

  OpenRatesApi api = new OpenRatesApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Currency Converter"),
            ),
            body: Center(
              child: CurrencyConverterWidget(api: this.api)
            )
        )
    );
  }
}
