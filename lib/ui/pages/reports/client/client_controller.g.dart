// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientController on ClientControllerBase, Store {
  late final _$clientReportAsyncAction =
      AsyncAction('ClientControllerBase.clientReport', context: context);

  @override
  Future<List<int>> clientReport(ReportType reportType) {
    return _$clientReportAsyncAction.run(() => super.clientReport(reportType));
  }

  late final _$_clientReportPDFAsyncAction =
      AsyncAction('ClientControllerBase._clientReportPDF', context: context);

  @override
  Future<List<int>> _clientReportPDF(List<Client> list) {
    return _$_clientReportPDFAsyncAction
        .run(() => super._clientReportPDF(list));
  }

  late final _$_clientReportExcelAsyncAction =
      AsyncAction('ClientControllerBase._clientReportExcel', context: context);

  @override
  Future<List<int>> _clientReportExcel(List<Client> list) {
    return _$_clientReportExcelAsyncAction
        .run(() => super._clientReportExcel(list));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
