// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RentalController on RentalControllerBase, Store {
  late final _$periodsAtom =
      Atom(name: 'RentalControllerBase.periods', context: context);

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
      Atom(name: 'RentalControllerBase.period', context: context);

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

  late final _$initialRentalDateAtom =
      Atom(name: 'RentalControllerBase.initialRentalDate', context: context);

  @override
  String get initialRentalDate {
    _$initialRentalDateAtom.reportRead();
    return super.initialRentalDate;
  }

  @override
  set initialRentalDate(String value) {
    _$initialRentalDateAtom.reportWrite(value, super.initialRentalDate, () {
      super.initialRentalDate = value;
    });
  }

  late final _$finalRentalDateAtom =
      Atom(name: 'RentalControllerBase.finalRentalDate', context: context);

  @override
  String get finalRentalDate {
    _$finalRentalDateAtom.reportRead();
    return super.finalRentalDate;
  }

  @override
  set finalRentalDate(String value) {
    _$finalRentalDateAtom.reportWrite(value, super.finalRentalDate, () {
      super.finalRentalDate = value;
    });
  }

  late final _$rentalReportAsyncAction =
      AsyncAction('RentalControllerBase.rentalReport', context: context);

  @override
  Future<List<int>> rentalReport(ReportType reportType) {
    return _$rentalReportAsyncAction.run(() => super.rentalReport(reportType));
  }

  late final _$_rentalReportPDFAsyncAction =
      AsyncAction('RentalControllerBase._rentalReportPDF', context: context);

  @override
  Future<List<int>> _rentalReportPDF(List<RentalReport> list) {
    return _$_rentalReportPDFAsyncAction
        .run(() => super._rentalReportPDF(list));
  }

  late final _$_rentalReportExcelAsyncAction =
      AsyncAction('RentalControllerBase._rentalReportExcel', context: context);

  @override
  Future<List<int>> _rentalReportExcel(List<RentalReport> list) {
    return _$_rentalReportExcelAsyncAction
        .run(() => super._rentalReportExcel(list));
  }

  @override
  String toString() {
    return '''
periods: ${periods},
period: ${period},
initialRentalDate: ${initialRentalDate},
finalRentalDate: ${finalRentalDate}
    ''';
  }
}
