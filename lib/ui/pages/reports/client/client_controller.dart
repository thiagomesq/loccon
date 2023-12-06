import 'dart:io';

import 'package:loccon/core/enums/report_type.dart';
import 'package:loccon/core/models/client.dart';
import 'package:loccon/infra/http/services/clients_service.dart';
import 'package:loccon/infra/http/services/excel_service.dart';
import 'package:loccon/infra/http/services/pdf_service.dart';
import 'package:mobx/mobx.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';

part 'client_controller.g.dart';

class ClientController = ClientControllerBase with _$ClientController;

abstract class ClientControllerBase extends ControllerBase with Store {
  final ClientsService _clientsService;
  final PDFService _pdfService;
  final ExcelService _excelService;

  ClientControllerBase(
    this._clientsService,
    this._pdfService,
    this._excelService,
  );

  @action
  Future<List<int>> clientReport(ReportType reportType) async {
    final list = await _clientsService.getClients();

    switch (reportType) {
      case ReportType.pdf:
        return await _clientReportPDF(list);
      case ReportType.excel:
        return await _clientReportExcel(list);
      default:
        return [];
    }
  }

  @action
  Future<List<int>> _clientReportPDF(List<Client> list) async {
    var path = '/storage/emulated/0/Download/client_report.pdf';
    var file = File(path);
    final bytes = await _pdfService.clientReport(list);
    file.writeAsBytesSync(bytes);
    return bytes;
  }

  @action
  Future<List<int>> _clientReportExcel(List<Client> list) async {
    var path = '/storage/emulated/0/Download/client_report.xlsx';
    var file = File(path);
    final bytes = await _pdfService.clientReport(list);
    file.writeAsBytesSync(bytes);
    return bytes;
  }
}
