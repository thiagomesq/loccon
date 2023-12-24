// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PricesController on PricesControllerBase, Store {
  Computed<Prices>? _$pricesComputed;

  @override
  Prices get prices =>
      (_$pricesComputed ??= Computed<Prices>(() => super.prices,
              name: 'PricesControllerBase.prices'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'PricesControllerBase.isFormValid'))
          .value;

  late final _$initialRentalPriceAtom =
      Atom(name: 'PricesControllerBase.initialRentalPrice', context: context);

  @override
  Map<String, double>? get initialRentalPrice {
    _$initialRentalPriceAtom.reportRead();
    return super.initialRentalPrice;
  }

  @override
  set initialRentalPrice(Map<String, double>? value) {
    _$initialRentalPriceAtom.reportWrite(value, super.initialRentalPrice, () {
      super.initialRentalPrice = value;
    });
  }

  late final _$additionalPricePerDayAtom = Atom(
      name: 'PricesControllerBase.additionalPricePerDay', context: context);

  @override
  double? get additionalPricePerDay {
    _$additionalPricePerDayAtom.reportRead();
    return super.additionalPricePerDay;
  }

  @override
  set additionalPricePerDay(double? value) {
    _$additionalPricePerDayAtom.reportWrite(value, super.additionalPricePerDay,
        () {
      super.additionalPricePerDay = value;
    });
  }

  late final _$sizesAtom =
      Atom(name: 'PricesControllerBase.sizes', context: context);

  @override
  List<String>? get sizes {
    _$sizesAtom.reportRead();
    return super.sizes;
  }

  @override
  set sizes(List<String>? value) {
    _$sizesAtom.reportWrite(value, super.sizes, () {
      super.sizes = value;
    });
  }

  late final _$sizeAtom =
      Atom(name: 'PricesControllerBase.size', context: context);

  @override
  String? get size {
    _$sizeAtom.reportRead();
    return super.size;
  }

  @override
  set size(String? value) {
    _$sizeAtom.reportWrite(value, super.size, () {
      super.size = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('PricesControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$PricesControllerBaseActionController =
      ActionController(name: 'PricesControllerBase', context: context);

  @override
  void fetch() {
    final _$actionInfo = _$PricesControllerBaseActionController.startAction(
        name: 'PricesControllerBase.fetch');
    try {
      return super.fetch();
    } finally {
      _$PricesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialRentalPrice: ${initialRentalPrice},
additionalPricePerDay: ${additionalPricePerDay},
sizes: ${sizes},
size: ${size},
prices: ${prices},
isFormValid: ${isFormValid}
    ''';
  }
}
