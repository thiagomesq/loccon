import 'package:loccon/core/models/prices.dart';
import 'package:mobx/mobx.dart';

class PricesStore with Store {
  @readonly
  Prices? _prices;

  Prices? get prices => _prices;

  @action
  void setPrices(Prices prices) {
    _prices = prices;
  }

  @action
  void clear() {
    _prices = null;
  }
}
