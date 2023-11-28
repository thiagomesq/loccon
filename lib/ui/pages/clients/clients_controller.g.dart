// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientsController on ClientsControllerBase, Store {
  late final _$clientsLoadingAtom =
      Atom(name: 'ClientsControllerBase.clientsLoading', context: context);

  @override
  ObservableFuture<ObservableList<Client>?> get clientsLoading {
    _$clientsLoadingAtom.reportRead();
    return super.clientsLoading;
  }

  @override
  set clientsLoading(ObservableFuture<ObservableList<Client>?> value) {
    _$clientsLoadingAtom.reportWrite(value, super.clientsLoading, () {
      super.clientsLoading = value;
    });
  }

  late final _$clientsAtom =
      Atom(name: 'ClientsControllerBase.clients', context: context);

  @override
  ObservableList<Client>? get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(ObservableList<Client>? value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('ClientsControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$deleteAsyncAction =
      AsyncAction('ClientsControllerBase.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
clientsLoading: ${clientsLoading},
clients: ${clients}
    ''';
  }
}
