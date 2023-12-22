import 'dart:io';

import 'package:dumpin/core/enums/report_type.dart';
import 'package:dumpin/core/models/client.dart';
import 'package:dumpin/core/models/rental_report.dart';
import 'package:dumpin/infra/http/services/clients_service.dart';
import 'package:dumpin/infra/http/services/excel_service.dart';
import 'package:dumpin/infra/http/services/pdf_service.dart';
import 'package:dumpin/infra/http/services/rental_service.dart';
import 'package:dumpin/ui/shared/controller_base/controller_base.dart';
import 'package:mobx/mobx.dart';

part 'customer_history_controller.g.dart';

class CustomerHistoryController = _CustomerHistoryControllerBase
    with _$CustomerHistoryController;

abstract class _CustomerHistoryControllerBase extends ControllerBase
    with Store {
  final ClientsService _clientsService;
  final RentalService _rentalService;
  final PDFService _pdfService;
  final ExcelService _excelService;

  _CustomerHistoryControllerBase(
    this._clientsService,
    this._rentalService,
    this._pdfService,
    this._excelService,
  ) {
    fetch();
  }

  @observable
  ObservableFuture<List<Client>> clientsLoading = ObservableFuture.value([]);

  @observable
  ObservableList<Client> clients = ObservableList<Client>();

  @observable
  Client? client;

  @observable
  List<String> periods = ['All', 'Weekly', 'Monthly', 'Yearly', 'Custom'];

  @observable
  String period = 'All';

  @observable
  String? initialDate;

  @observable
  String? finalDate;

  @computed
  bool get isFormValid {
    if (period == 'All') {
      return client != null;
    } else {
      return client != null && initialDate != null && finalDate != null;
    }
  }

  @action
  Future<void> fetch() async {
    clientsLoading = ObservableFuture(_clientsService.getClients());
    clients = (await clientsLoading).asObservable();
  }

  @action
  Future<List<int>> customerHistoryReport(ReportType reportType) async {
    var list = <RentalReport>[];
    if (period == 'All') {
      list = await _rentalService.getCustomerHistoryReport(client!.id!);
    } else {
      list = await _rentalService.getCustomerHistoryReport(
        client!.id!,
        initialDate: initialDate,
        finalDate: finalDate,
      );
    }

    switch (reportType) {
      case ReportType.pdf:
        return await _customerHistoryReportPDF(list);
      /*case ReportType.excel:
        return await _customerHistoryReportExcel(list);*/
      default:
        return [];
    }
  }

  @action
  Future<List<int>> _customerHistoryReportPDF(List<RentalReport> list) async {
    var path = '';
    if (period == 'All') {
      path =
          '/storage/emulated/0/Download/customer_history_report-${client!.name}.pdf';
    } else {
      path =
          '/storage/emulated/0/Download/customer_history_report-${client!.name}-$initialDate-$finalDate.pdf';
    }
    var file = File(path);
    var bytes = <int>[];
    if (period == 'All') {
      bytes = await _pdfService.customerHistoryReport(list);
    } else {
      bytes = await _pdfService.customerHistoryReport(
        list,
        initialDate: initialDate,
        finalDate: finalDate,
      );
    }
    await file.writeAsBytes(bytes);
    return bytes;
  }
}
