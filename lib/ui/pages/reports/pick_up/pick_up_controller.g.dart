// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PickUpController on PickUpControllerBase, Store {
  late final _$periodsAtom =
      Atom(name: 'PickUpControllerBase.periods', context: context);

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
      Atom(name: 'PickUpControllerBase.period', context: context);

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

  late final _$initialPickUpDateAtom =
      Atom(name: 'PickUpControllerBase.initialPickUpDate', context: context);

  @override
  String get initialPickUpDate {
    _$initialPickUpDateAtom.reportRead();
    return super.initialPickUpDate;
  }

  @override
  set initialPickUpDate(String value) {
    _$initialPickUpDateAtom.reportWrite(value, super.initialPickUpDate, () {
      super.initialPickUpDate = value;
    });
  }

  late final _$finalPickUpDateAtom =
      Atom(name: 'PickUpControllerBase.finalPickUpDate', context: context);

  @override
  String get finalPickUpDate {
    _$finalPickUpDateAtom.reportRead();
    return super.finalPickUpDate;
  }

  @override
  set finalPickUpDate(String value) {
    _$finalPickUpDateAtom.reportWrite(value, super.finalPickUpDate, () {
      super.finalPickUpDate = value;
    });
  }

  late final _$pickUpReportAsyncAction =
      AsyncAction('PickUpControllerBase.pickUpReport', context: context);

  @override
  Future<List<int>> pickUpReport(ReportType reportType) {
    return _$pickUpReportAsyncAction.run(() => super.pickUpReport(reportType));
  }

  late final _$_pickUpReportPDFAsyncAction =
      AsyncAction('PickUpControllerBase._pickUpReportPDF', context: context);

  @override
  Future<List<int>> _pickUpReportPDF(List<RentalReport> list) {
    return _$_pickUpReportPDFAsyncAction
        .run(() => super._pickUpReportPDF(list));
  }

  late final _$_pickUpReportExcelAsyncAction =
      AsyncAction('PickUpControllerBase._pickUpReportExcel', context: context);

  @override
  Future<List<int>> _pickUpReportExcel(List<RentalReport> list) {
    return _$_pickUpReportExcelAsyncAction
        .run(() => super._pickUpReportExcel(list));
  }

  @override
  String toString() {
    return '''
periods: ${periods},
period: ${period},
initialPickUpDate: ${initialPickUpDate},
finalPickUpDate: ${finalPickUpDate}
    ''';
  }
}
