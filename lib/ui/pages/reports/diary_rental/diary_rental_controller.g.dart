// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_rental_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiaryRentalController on DiaryRentalControllerBase, Store {
  late final _$rentalDateAtom =
      Atom(name: 'DiaryRentalControllerBase.rentalDate', context: context);

  @override
  String get rentalDate {
    _$rentalDateAtom.reportRead();
    return super.rentalDate;
  }

  @override
  set rentalDate(String value) {
    _$rentalDateAtom.reportWrite(value, super.rentalDate, () {
      super.rentalDate = value;
    });
  }

  late final _$diaryRentalReportAsyncAction = AsyncAction(
      'DiaryRentalControllerBase.diaryRentalReport',
      context: context);

  @override
  Future<List<int>> diaryRentalReport(ReportType reportType) {
    return _$diaryRentalReportAsyncAction
        .run(() => super.diaryRentalReport(reportType));
  }

  late final _$_diaryRentalReportPDFAsyncAction = AsyncAction(
      'DiaryRentalControllerBase._diaryRentalReportPDF',
      context: context);

  @override
  Future<List<int>> _diaryRentalReportPDF(List<DailyRentalReport> list) {
    return _$_diaryRentalReportPDFAsyncAction
        .run(() => super._diaryRentalReportPDF(list));
  }

  late final _$_diaryRentalReportExcelAsyncAction = AsyncAction(
      'DiaryRentalControllerBase._diaryRentalReportExcel',
      context: context);

  @override
  Future<List<int>> _diaryRentalReportExcel(List<DailyRentalReport> list) {
    return _$_diaryRentalReportExcelAsyncAction
        .run(() => super._diaryRentalReportExcel(list));
  }

  @override
  String toString() {
    return '''
rentalDate: ${rentalDate}
    ''';
  }
}
