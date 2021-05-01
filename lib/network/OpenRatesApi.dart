import 'dart:convert';
import 'CurrencyNetwork.dart';
import 'package:http/http.dart' as http;

/// The Api for getting exchange rates.
///
/// The implementation of [CurrencyNetwork] that will be used in the [ExchangeWiget]
/// to retrive the exchange rates from the openexchange api.
class OpenRatesApi implements CurrencyNetwork {

  /// The API's base URL.
  @override
  String get baseUrl => "api.openrates.io";

  /// Gets the exchange rate from [baseCurrency] to [targetCurrency]
  @override
  getRate(String baseCurrency, String targetCurrency) async {
    var query = {"base":baseCurrency, "symbols" : targetCurrency};
    var endpoint = Uri.https(this.baseUrl, "/latest", query);
    var json = await getJsonUrl(endpoint);
    var rate = json['rates'][targetCurrency];
    return rate;
  }

  /// Gets all available rates for the [baseCurrency]
  @override
  Future<Map> getRates(String baseCurrency) async{
    var query = {"base":baseCurrency};
    var endpoint = Uri.https(this.baseUrl, "/latest", query);
    var json = await getJsonUrl(endpoint);
    Map rate = json;
    return rate;
  }

  Future<Map> getJsonUrl(Uri url) async {
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return json;
  }

}