// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieval_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiaryRetrievalController on DiaryRetrievalControllerBase, Store {
  late final _$periodsAtom =
      Atom(name: 'DiaryRetrievalControllerBase.periods', context: context);

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
      Atom(name: 'DiaryRetrievalControllerBase.period', context: context);

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

  late final _$initialRetrievalDateAtom = Atom(
      name: 'DiaryRetrievalControllerBase.initialRetrievalDate',
      context: context);

  @override
  String get initialRetrievalDate {
    _$initialRetrievalDateAtom.reportRead();
    return super.initialRetrievalDate;
  }

  @override
  set initialRetrievalDate(String value) {
    _$initialRetrievalDateAtom.reportWrite(value, super.initialRetrievalDate,
        () {
      super.initialRetrievalDate = value;
    });
  }

  late final _$finalRetrievalDateAtom = Atom(
      name: 'DiaryRetrievalControllerBase.finalRetrievalDate',
      context: context);

  @override
  String get finalRetrievalDate {
    _$finalRetrievalDateAtom.reportRead();
    return super.finalRetrievalDate;
  }

  @override
  set finalRetrievalDate(String value) {
    _$finalRetrievalDateAtom.reportWrite(value, super.finalRetrievalDate, () {
      super.finalRetrievalDate = value;
    });
  }

  late final _$retrievalReportAsyncAction = AsyncAction(
      'DiaryRetrievalControllerBase.retrievalReport',
      context: context);

  @override
  Future<List<int>> retrievalReport(ReportType reportType) {
    return _$retrievalReportAsyncAction
        .run(() => super.retrievalReport(reportType));
  }

  late final _$_retrievalReportPDFAsyncAction = AsyncAction(
      'DiaryRetrievalControllerBase._retrievalReportPDF',
      context: context);

  @override
  Future<List<int>> _retrievalReportPDF(List<RentalReport> list) {
    return _$_retrievalReportPDFAsyncAction
        .run(() => super._retrievalReportPDF(list));
  }

  late final _$_retrievalReportExcelAsyncAction = AsyncAction(
      'DiaryRetrievalControllerBase._retrievalReportExcel',
      context: context);

  @override
  Future<List<int>> _retrievalReportExcel(List<RentalReport> list) {
    return _$_retrievalReportExcelAsyncAction
        .run(() => super._retrievalReportExcel(list));
  }

  @override
  String toString() {
    return '''
periods: ${periods},
period: ${period},
initialRetrievalDate: ${initialRetrievalDate},
finalRetrievalDate: ${finalRetrievalDate}
    ''';
  }
}
