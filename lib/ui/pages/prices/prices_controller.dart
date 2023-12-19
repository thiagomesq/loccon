import 'package:dumpin/core/models/prices.dart';
import 'package:dumpin/infra/http/services/prices_service.dart';
import 'package:dumpin/ui/shared/controller_base/controller_base.dart';
import 'package:dumpin/ui/stores/prices_store.dart';
import 'package:mobx/mobx.dart';

part 'prices_controller.g.dart';

class PricesController = PricesControllerBase with _$PricesController;

abstract class PricesControllerBase extends ControllerBase with Store {
  final PricesService _pricesService;
  final PricesStore _pricesStore;

  PricesControllerBase(
    this._pricesService,
    this._pricesStore,
  ) {
    fetch();
  }

  @observable
  double? weeklyPrice;

  @observable
  double? additionalPricePerDay;

  @computed
  Prices get prices => _pricesStore.prices!;

  @computed
  bool get isFormValid => weeklyPrice != null && additionalPricePerDay != null;

  @action
  void fetch() {
    weeklyPrice = prices.weeklyPrice;
    additionalPricePerDay = prices.additionalPricePerDay;
  }

  @action
  Future<void> save() async {
    prices.weeklyPrice = weeklyPrice;
    prices.additionalPricePerDay = additionalPricePerDay;
    await _pricesService.savePrices(prices);
    _pricesStore.setPrices(prices);
  }
}
