import 'dart:io';

import 'package:intl/intl.dart';
import 'package:loccon/core/enums/report_type.dart';
import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/core/models/rental_report.dart';
import 'package:loccon/infra/http/services/dumpster_service.dart';
import 'package:loccon/infra/http/services/excel_service.dart';
import 'package:loccon/infra/http/services/pdf_service.dart';
import 'package:loccon/infra/http/services/rental_service.dart';
import 'package:mobx/mobx.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';

part 'dumpster_utilization_controller.g.dart';

class DumpsterUtilizationController = DumpsterUtilizationControllerBase
    with _$DumpsterUtilizationController;

abstract class DumpsterUtilizationControllerBase extends ControllerBase
    with Store {
  final DumpsterService _dumpsterService;
  final RentalService _rentalService;
  final PDFService _pdfService;
  final ExcelService _excelService;

  DumpsterUtilizationControllerBase(
    this._dumpsterService,
    this._rentalService,
    this._pdfService,
    this._excelService,
  ) {
    fetch();
  }

  @observable
  List<String> periods = ['Weekly', 'Monthly', 'Yearly', 'Custom'];

  @observable
  String period = 'Weekly';

  @observable
  String initialDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  @observable
  String finalDate = DateFormat('MM-dd-yyyy')
      .format(DateTime.now().add(const Duration(days: 1)));

  @observable
  ObservableFuture<ObservableList<Dumpster>?> dumpstersLoading =
      ObservableFuture.value(null);

  @observable
  ObservableList<Dumpster>? dumpsters;

  @observable
  Dumpster? dumpster;

  @observable
  List<String>? sizes;

  @observable
  String size = 'Unique';

  @computed
  bool get isFormValid {
    if (size == 'Unique') {
      return dumpster != null;
    } else {
      return true;
    }
  }

  @action
  Future<void> fetch() async {
    dumpstersLoading = _dumpsterService.getDumpsters().asObservable();
    dumpsters = await dumpstersLoading;
    if (dumpsters != null && dumpsters!.isNotEmpty) {
      sizes =
          dumpsters!.map((dumpster) => '${dumpster.size}Y').toSet().toList();
      sizes!.add('Unique');
    }
  }

  @action
  Future<List<int>> dumpsterUtilizationReport(ReportType reportType) async {
    final list = await _rentalService.getDumpsterUtilizationReport(
      initialDate,
      finalDate,
      dumpsterId: dumpster?.id,
      size: int.tryParse(size.contains('Y') ? size.substring(0, 2) : size),
    );

    switch (reportType) {
      case ReportType.pdf:
        return await _dumpsterUtilizationReportPDF(list);
      /*case ReportType.excel:
        return await _dumpsterUtilizationReportExcel(list);*/
      default:
        return [];
    }
  }

  @action
  Future<List<int>> _dumpsterUtilizationReportPDF(
      List<RentalReport> list) async {
    var path = '';
    if (dumpster != null) {
      path =
          '/storage/emulated/0/Download/dumpster_utilization_report-${dumpster!.code}-$initialDate-$finalDate.pdf';
    } else {
      path =
          '/storage/emulated/0/Download/dumpster_utilization_report-${size}Y-$initialDate-$finalDate.pdf';
    }

    var file = File(path);
    final bytes = await _pdfService.dumpsterUtilizationReport(
      list,
      initialDate,
      finalDate,
    );
    file.writeAsBytesSync(bytes);
    return bytes;
  }

  /*@action
  Future<List<int>> _dumpsterUtilizationReportExcel(List<RentalReport> list) {

  }*/
}
