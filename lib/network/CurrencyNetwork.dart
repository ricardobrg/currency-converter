/// The network dependency
///
/// This class defines the methods that a class must implement in order to be
/// used as a dependency in the widget.
abstract class CurrencyNetwork {

  abstract final String baseUrl;

  getRates(String baseCurrency);

  getRate(String baseCurrency, String targetCurrency);
}