import 'package:currency_converter/network/OpenRatesApi.dart';
import 'package:test/test.dart';

void main() {
  test('get USD X EUR rates', () async {
    var api = new OpenRatesApi();
    var rate = await api.getRate("USD","BRL");
    expect(rate, isNonNegative );
  });

  test('get USD rates', () async{
    var api = new OpenRatesApi();
    var json = await api.getRates("USD");
    expect(json['base'],'USD');
  });

  test('get json uri', () async{
    var api = new OpenRatesApi();
    var uri = Uri.https("api.openrates.io","/latest", {"base":"USD"});
    var json = await api.getJsonUrl(uri);
    expect(json,isMap);
  });
}