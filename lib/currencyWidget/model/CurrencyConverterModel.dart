import 'package:currency_converter/network/OpenRatesApi.dart';
import 'package:flutter/material.dart';

class CurrencyConverterModel  extends ChangeNotifier {
  String _from = "USD";
  String _to = "USD";
  double _originalValue = 100.00;
  double _convertedValue = 100.00;
  double _rate = 1;
  OpenRatesApi api = new OpenRatesApi();

  String get from => _from;

  double get convertedValue => _convertedValue;
  set convertedValue(double convertedValue){
    _convertedValue = convertedValue;
    _updateOriginal();
  }

  double get originalValue => _originalValue;
  set originalValue(double originalValue){
    _originalValue = originalValue;
    _updateConverted();
  }

  set from(String from){
    _from = from;
    _updateRate();
  }

  String get to => _to;
  set to(String to){
    _to = to;
    _updateRate();
  }

  Map<String, String> listOfCurrencies = {
      "GBP": "Pounds",
      "HKD": "Hong Kong Dollars",
      "IDR": "IDR",
      "ILS": "ILS",
      "DKK": "DKK",
      "DKK": "DKK",
      "CHF": "CHF",
      "MXN":"MXN",
      "CZK":"CZK",
      "SGD":"SGD",
      "THB":"THB",
      "HRK":"HRK",
      "EUR":"EUR",
      "MYR":"MYR",
      "NOK":"NOK",
      "CNY":"CNY",
      "BGN":"BGN",
      "PHP":"PHP",
      "PLN":"PLN",
      "ZAR":"ZAR",
      "CAD":"CAD",
      "ISK":"ISK",
      "BRL":"BRL",
      "RON":"RON",
      "NZD":"NZD",
      "TRY":"TRY",
      "JPY":"JPY",
      "RUB":"RUB",
      "KRW":"KRW",
      "USD":"USD",
      "AUD":"AUD",
      "HUF":"HUF",
      "SEK":"SEK",
  };

  void _updateRate() async {
    print("$from -> $to");
    _rate = await this.api.getRate(from, to);
    _updateConverted();
  }

  void _updateConverted() {
    _convertedValue = _originalValue * _rate;
    notifyListeners();
  }

  void _updateOriginal() {
    _originalValue = _convertedValue / _rate;
    notifyListeners();
  }
}