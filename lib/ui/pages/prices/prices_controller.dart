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
  Map<String, double>? initialRentalPrice;

  @observable
  double? additionalPricePerDay;

  @observable
  List<String>? sizes;

  @observable
  String? size;

  @computed
  Prices get prices => _pricesStore.prices!;

  @computed
  bool get isFormValid =>
      initialRentalPrice != null && additionalPricePerDay != null;

  @action
  void fetch() {
    initialRentalPrice = prices.initialRentalPrice;
    sizes = initialRentalPrice!.keys.toList();
    sizes!.sort((a, b) => a.compareTo(b));
    size = sizes!.first;
    additionalPricePerDay = prices.additionalPricePerDay;
  }

  @action
  Future<void> save() async {
    prices.initialRentalPrice = initialRentalPrice;
    prices.additionalPricePerDay = additionalPricePerDay;
    await _pricesService.savePrices(prices);
    _pricesStore.setPrices(prices);
  }
}
