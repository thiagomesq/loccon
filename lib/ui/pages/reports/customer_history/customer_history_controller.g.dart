// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerHistoryController on _CustomerHistoryControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CustomerHistoryControllerBase.isFormValid'))
          .value;

  late final _$clientsLoadingAtom = Atom(
      name: '_CustomerHistoryControllerBase.clientsLoading', context: context);

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
      Atom(name: '_CustomerHistoryControllerBase.clients', context: context);

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
      Atom(name: '_CustomerHistoryControllerBase.client', context: context);

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

  late final _$periodsAtom =
      Atom(name: '_CustomerHistoryControllerBase.periods', context: context);

  @override
  List<String> get periods {
    _$periodsAtom.reportRead();
    return super.periods;
  }

  @override
  set periods(List<String> value) {
    _$periodsAtom.reportWrite(value, super.periods, () {
      super.periods = value;
    });
  }

  late final _$periodAtom =
      Atom(name: '_CustomerHistoryControllerBase.period', context: context);

  @override
  String get period {
    _$periodAtom.reportRead();
    return super.period;
  }

  @override
  set period(String value) {
    _$periodAtom.reportWrite(value, super.period, () {
      super.period = value;
    });
  }

  late final _$initialDateAtom = Atom(
      name: '_CustomerHistoryControllerBase.initialDate', context: context);

  @override
  String? get initialDate {
    _$initialDateAtom.reportRead();
    return super.initialDate;
  }

  @override
  set initialDate(String? value) {
    _$initialDateAtom.reportWrite(value, super.initialDate, () {
      super.initialDate = value;
    });
  }

  late final _$finalDateAtom =
      Atom(name: '_CustomerHistoryControllerBase.finalDate', context: context);

  @override
  String? get finalDate {
    _$finalDateAtom.reportRead();
    return super.finalDate;
  }

  @override
  set finalDate(String? value) {
    _$finalDateAtom.reportWrite(value, super.finalDate, () {
      super.finalDate = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('_CustomerHistoryControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$customerHistoryReportAsyncAction = AsyncAction(
      '_CustomerHistoryControllerBase.customerHistoryReport',
      context: context);

  @override
  Future<List<int>> customerHistoryReport(ReportType reportType) {
    return _$customerHistoryReportAsyncAction
        .run(() => super.customerHistoryReport(reportType));
  }

  late final _$_customerHistoryReportPDFAsyncAction = AsyncAction(
      '_CustomerHistoryControllerBase._customerHistoryReportPDF',
      context: context);

  @override
  Future<List<int>> _customerHistoryReportPDF(List<RentalReport> list) {
    return _$_customerHistoryReportPDFAsyncAction
        .run(() => super._customerHistoryReportPDF(list));
  }

  @override
  String toString() {
    return '''
clientsLoading: ${clientsLoading},
clients: ${clients},
client: ${client},
periods: ${periods},
period: ${period},
initialDate: ${initialDate},
finalDate: ${finalDate},
isFormValid: ${isFormValid}
    ''';
  }
}
