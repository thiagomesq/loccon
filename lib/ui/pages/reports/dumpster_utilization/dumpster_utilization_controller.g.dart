// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dumpster_utilization_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DumpsterUtilizationController
    on DumpsterUtilizationControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'DumpsterUtilizationControllerBase.isFormValid'))
          .value;

  late final _$periodsAtom =
      Atom(name: 'DumpsterUtilizationControllerBase.periods', context: context);

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
      Atom(name: 'DumpsterUtilizationControllerBase.period', context: context);

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
      name: 'DumpsterUtilizationControllerBase.initialDate', context: context);

  @override
  String get initialDate {
    _$initialDateAtom.reportRead();
    return super.initialDate;
  }

  @override
  set initialDate(String value) {
    _$initialDateAtom.reportWrite(value, super.initialDate, () {
      super.initialDate = value;
    });
  }

  late final _$finalDateAtom = Atom(
      name: 'DumpsterUtilizationControllerBase.finalDate', context: context);

  @override
  String get finalDate {
    _$finalDateAtom.reportRead();
    return super.finalDate;
  }

  @override
  set finalDate(String value) {
    _$finalDateAtom.reportWrite(value, super.finalDate, () {
      super.finalDate = value;
    });
  }

  late final _$dumpstersLoadingAtom = Atom(
      name: 'DumpsterUtilizationControllerBase.dumpstersLoading',
      context: context);

  @override
  ObservableFuture<ObservableList<Dumpster>?> get dumpstersLoading {
    _$dumpstersLoadingAtom.reportRead();
    return super.dumpstersLoading;
  }

  @override
  set dumpstersLoading(ObservableFuture<ObservableList<Dumpster>?> value) {
    _$dumpstersLoadingAtom.reportWrite(value, super.dumpstersLoading, () {
      super.dumpstersLoading = value;
    });
  }

  late final _$dumpstersAtom = Atom(
      name: 'DumpsterUtilizationControllerBase.dumpsters', context: context);

  @override
  ObservableList<Dumpster>? get dumpsters {
    _$dumpstersAtom.reportRead();
    return super.dumpsters;
  }

  @override
  set dumpsters(ObservableList<Dumpster>? value) {
    _$dumpstersAtom.reportWrite(value, super.dumpsters, () {
      super.dumpsters = value;
    });
  }

  late final _$dumpsterAtom = Atom(
      name: 'DumpsterUtilizationControllerBase.dumpster', context: context);

  @override
  Dumpster? get dumpster {
    _$dumpsterAtom.reportRead();
    return super.dumpster;
  }

  @override
  set dumpster(Dumpster? value) {
    _$dumpsterAtom.reportWrite(value, super.dumpster, () {
      super.dumpster = value;
    });
  }

  late final _$sizesAtom =
      Atom(name: 'DumpsterUtilizationControllerBase.sizes', context: context);

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
      Atom(name: 'DumpsterUtilizationControllerBase.size', context: context);

  @override
  String get size {
    _$sizeAtom.reportRead();
    return super.size;
  }

  @override
  set size(String value) {
    _$sizeAtom.reportWrite(value, super.size, () {
      super.size = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('DumpsterUtilizationControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$dumpsterUtilizationReportAsyncAction = AsyncAction(
      'DumpsterUtilizationControllerBase.dumpsterUtilizationReport',
      context: context);

  @override
  Future<List<int>> dumpsterUtilizationReport(ReportType reportType) {
    return _$dumpsterUtilizationReportAsyncAction
        .run(() => super.dumpsterUtilizationReport(reportType));
  }

  late final _$_dumpsterUtilizationReportPDFAsyncAction = AsyncAction(
      'DumpsterUtilizationControllerBase._dumpsterUtilizationReportPDF',
      context: context);

  @override
  Future<List<int>> _dumpsterUtilizationReportPDF(List<RentalReport> list) {
    return _$_dumpsterUtilizationReportPDFAsyncAction
        .run(() => super._dumpsterUtilizationReportPDF(list));
  }

  @override
  String toString() {
    return '''
periods: ${periods},
period: ${period},
initialDate: ${initialDate},
finalDate: ${finalDate},
dumpstersLoading: ${dumpstersLoading},
dumpsters: ${dumpsters},
dumpster: ${dumpster},
sizes: ${sizes},
size: ${size},
isFormValid: ${isFormValid}
    ''';
  }
}
