import 'dart:io';

import 'package:intl/intl.dart';
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

  @observable
  String? initialRegistrationDate;

  @observable
  String? finalRegistrationDate;

  @computed
  bool get isFormValid {
    if (initialRegistrationDate == null && finalRegistrationDate == null) {
      return true;
    } else if (initialRegistrationDate == null &&
        finalRegistrationDate != null) {
      return false;
    } else if (initialRegistrationDate != null &&
        finalRegistrationDate == null) {
      return false;
    }
    return true;
  }

  @action
  Future<List<int>> clientReport(ReportType reportType) async {
    final list = await _clientsService.getClients(
      initialDate: initialRegistrationDate,
      finalDate: finalRegistrationDate,
    );

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
    var path = '';
    if (initialRegistrationDate != null && finalRegistrationDate != null) {
      path =
          '/storage/emulated/0/Download/client_report-$initialRegistrationDate-$finalRegistrationDate.pdf';
    } else {
      path = '/storage/emulated/0/Download/client_report.pdf';
    }
    var file = File(path);
    final bytes = await _pdfService.clientReport(
      list,
      initialDate: initialRegistrationDate,
      finalDate: finalRegistrationDate,
    );
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
