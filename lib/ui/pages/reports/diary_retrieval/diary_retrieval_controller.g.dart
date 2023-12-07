// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_retrieval_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiaryRetrievalController on DiaryRetrievalControllerBase, Store {
  late final _$retrievalDateAtom = Atom(
      name: 'DiaryRetrievalControllerBase.retrievalDate', context: context);

  @override
  String get retrievalDate {
    _$retrievalDateAtom.reportRead();
    return super.retrievalDate;
  }

  @override
  set retrievalDate(String value) {
    _$retrievalDateAtom.reportWrite(value, super.retrievalDate, () {
      super.retrievalDate = value;
    });
  }

  late final _$diaryRetrievalReportAsyncAction = AsyncAction(
      'DiaryRetrievalControllerBase.diaryRetrievalReport',
      context: context);

  @override
  Future<List<int>> diaryRetrievalReport(ReportType reportType) {
    return _$diaryRetrievalReportAsyncAction
        .run(() => super.diaryRetrievalReport(reportType));
  }

  late final _$_diaryRetrievalReportPDFAsyncAction = AsyncAction(
      'DiaryRetrievalControllerBase._diaryRetrievalReportPDF',
      context: context);

  @override
  Future<List<int>> _diaryRetrievalReportPDF(List<RentalReport> list) {
    return _$_diaryRetrievalReportPDFAsyncAction
        .run(() => super._diaryRetrievalReportPDF(list));
  }

  late final _$_diaryRetrievalReportExcelAsyncAction = AsyncAction(
      'DiaryRetrievalControllerBase._diaryRetrievalReportExcel',
      context: context);

  @override
  Future<List<int>> _diaryRetrievalReportExcel(List<RentalReport> list) {
    return _$_diaryRetrievalReportExcelAsyncAction
        .run(() => super._diaryRetrievalReportExcel(list));
  }

  @override
  String toString() {
    return '''
retrievalDate: ${retrievalDate}
    ''';
  }
}
