// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddEditRentalController on AddEditRentalControllerBase, Store {
  Computed<Dumpster>? _$dumpsterComputed;

  @override
  Dumpster get dumpster =>
      (_$dumpsterComputed ??= Computed<Dumpster>(() => super.dumpster,
              name: 'AddEditRentalControllerBase.dumpster'))
          .value;
  Computed<Rental?>? _$rentalComputed;

  @override
  Rental? get rental =>
      (_$rentalComputed ??= Computed<Rental?>(() => super.rental,
              name: 'AddEditRentalControllerBase.rental'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'AddEditRentalControllerBase.isFormValid'))
          .value;

  late final _$clientsLoadingAtom = Atom(
      name: 'AddEditRentalControllerBase.clientsLoading', context: context);

  @override
  ObservableFuture<List<Client>> get clientsLoading {
    _$clientsLoadingAtom.reportRead();
    return super.clientsLoading;
  }

  @override
  set clientsLoading(ObservableFuture<List<Client>> value) {
    _$clientsLoadingAtom.reportWrite(value, super.clientsLoading, () {
      super.clientsLoading = value;
    });
  }

  late final _$clientsAtom =
      Atom(name: 'AddEditRentalControllerBase.clients', context: context);

  @override
  ObservableList<Client> get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(ObservableList<Client> value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  late final _$clientAtom =
      Atom(name: 'AddEditRentalControllerBase.client', context: context);

  @override
  Client? get client {
    _$clientAtom.reportRead();
    return super.client;
  }

  @override
  set client(Client? value) {
    _$clientAtom.reportWrite(value, super.client, () {
      super.client = value;
    });
  }

  late final _$rentalDateAtom =
      Atom(name: 'AddEditRentalControllerBase.rentalDate', context: context);

  @override
  String? get rentalDate {
    _$rentalDateAtom.reportRead();
    return super.rentalDate;
  }

  @override
  set rentalDate(String? value) {
    _$rentalDateAtom.reportWrite(value, super.rentalDate, () {
      super.rentalDate = value;
    });
  }

  late final _$streetAtom =
      Atom(name: 'AddEditRentalControllerBase.street', context: context);

  @override
  String? get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String? value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  late final _$numberAtom =
      Atom(name: 'AddEditRentalControllerBase.number', context: context);

  @override
  String? get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String? value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$neighborhoodAtom =
      Atom(name: 'AddEditRentalControllerBase.neighborhood', context: context);

  @override
  String? get neighborhood {
    _$neighborhoodAtom.reportRead();
    return super.neighborhood;
  }

  @override
  set neighborhood(String? value) {
    _$neighborhoodAtom.reportWrite(value, super.neighborhood, () {
      super.neighborhood = value;
    });
  }

  late final _$cityAtom =
      Atom(name: 'AddEditRentalControllerBase.city', context: context);

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'AddEditRentalControllerBase.state', context: context);

  @override
  String? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$zipCodeAtom =
      Atom(name: 'AddEditRentalControllerBase.zipCode', context: context);

  @override
  String? get zipCode {
    _$zipCodeAtom.reportRead();
    return super.zipCode;
  }

  @override
  set zipCode(String? value) {
    _$zipCodeAtom.reportWrite(value, super.zipCode, () {
      super.zipCode = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('AddEditRentalControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$saveAsyncAction =
      AsyncAction('AddEditRentalControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  @override
  String toString() {
    return '''
clientsLoading: ${clientsLoading},
clients: ${clients},
client: ${client},
rentalDate: ${rentalDate},
street: ${street},
number: ${number},
neighborhood: ${neighborhood},
city: ${city},
state: ${state},
zipCode: ${zipCode},
dumpster: ${dumpster},
rental: ${rental},
isFormValid: ${isFormValid}
    ''';
  }
}
