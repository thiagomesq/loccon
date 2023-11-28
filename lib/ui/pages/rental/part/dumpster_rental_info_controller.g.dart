// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dumpster_rental_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DumpsterRentalInfoController
    on DumpsterRentalInfoControllerBase, Store {
  Computed<Prices>? _$pricesComputed;

  @override
  Prices get prices =>
      (_$pricesComputed ??= Computed<Prices>(() => super.prices,
              name: 'DumpsterRentalInfoControllerBase.prices'))
          .value;

  late final _$dumpsterLoadingAtom = Atom(
      name: 'DumpsterRentalInfoControllerBase.dumpsterLoading',
      context: context);

  @override
  ObservableFuture<Dumpster?> get dumpsterLoading {
    _$dumpsterLoadingAtom.reportRead();
    return super.dumpsterLoading;
  }

  @override
  set dumpsterLoading(ObservableFuture<Dumpster?> value) {
    _$dumpsterLoadingAtom.reportWrite(value, super.dumpsterLoading, () {
      super.dumpsterLoading = value;
    });
  }

  late final _$dumpsterAtom =
      Atom(name: 'DumpsterRentalInfoControllerBase.dumpster', context: context);

  @override
  Dumpster get dumpster {
    _$dumpsterAtom.reportRead();
    return super.dumpster;
  }

  @override
  set dumpster(Dumpster value) {
    _$dumpsterAtom.reportWrite(value, super.dumpster, () {
      super.dumpster = value;
    });
  }

  late final _$rentalAtom =
      Atom(name: 'DumpsterRentalInfoControllerBase.rental', context: context);

  @override
  Rental? get rental {
    _$rentalAtom.reportRead();
    return super.rental;
  }

  @override
  set rental(Rental? value) {
    _$rentalAtom.reportWrite(value, super.rental, () {
      super.rental = value;
    });
  }

  late final _$isBeforeRentalDateAtom = Atom(
      name: 'DumpsterRentalInfoControllerBase.isBeforeRentalDate',
      context: context);

  @override
  bool get isBeforeRentalDate {
    _$isBeforeRentalDateAtom.reportRead();
    return super.isBeforeRentalDate;
  }

  @override
  set isBeforeRentalDate(bool value) {
    _$isBeforeRentalDateAtom.reportWrite(value, super.isBeforeRentalDate, () {
      super.isBeforeRentalDate = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('DumpsterRentalInfoControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$retrieveOrCancelAsyncAction = AsyncAction(
      'DumpsterRentalInfoControllerBase.retrieveOrCancel',
      context: context);

  @override
  Future<void> retrieveOrCancel() {
    return _$retrieveOrCancelAsyncAction.run(() => super.retrieveOrCancel());
  }

  @override
  String toString() {
    return '''
dumpsterLoading: ${dumpsterLoading},
dumpster: ${dumpster},
rental: ${rental},
isBeforeRentalDate: ${isBeforeRentalDate},
prices: ${prices}
    ''';
  }
}
