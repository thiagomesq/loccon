import 'dart:io';

import 'package:intl/intl.dart';
import 'package:dumpin/core/enums/report_type.dart';
import 'package:dumpin/core/models/rental_report.dart';
import 'package:dumpin/infra/http/services/excel_service.dart';
import 'package:dumpin/infra/http/services/pdf_service.dart';
import 'package:dumpin/infra/http/services/rental_service.dart';
import 'package:dumpin/ui/shared/controller_base/controller_base.dart';
import 'package:mobx/mobx.dart';

part 'pick_up_controller.g.dart';

class PickUpController = PickUpControllerBase with _$PickUpController;

abstract class PickUpControllerBase extends ControllerBase with Store {
  final RentalService _rentalService;
  final PDFService _pdfService;
  final ExcelService _excelService;

  PickUpControllerBase(
    this._rentalService,
    this._pdfService,
    this._excelService,
  );

  @observable
  List<String> periods = ['Daily', 'Weekly', 'Monthly', 'Yearly', 'Custom'];

  @observable
  String period = 'Daily';

  @observable
  String initialPickUpDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  @observable
  String finalPickUpDate = DateFormat('MM-dd-yyyy')
      .format(DateTime.now().add(const Duration(days: 1)));

  @action
  Future<List<int>> pickUpReport(ReportType reportType) async {
    var list = <RentalReport>[];
    if (period == 'Daily') {
      list = await _rentalService.getDailyPickUpReport(initialPickUpDate);
    } else {
      list = await _rentalService.getPickUpReport(
        initialPickUpDate,
        finalPickUpDate,
      );
    }

    switch (reportType) {
      case ReportType.pdf:
        return await _pickUpReportPDF(list);
      case ReportType.excel:
        return await _pickUpReportExcel(list);
      default:
        return [];
    }
  }

  @action
  Future<List<int>> _pickUpReportPDF(List<RentalReport> list) async {
    var path = '';
    if (period == 'Daily') {
      path =
          '/storage/emulated/0/Download/daily_pick_up_report-$initialPickUpDate.pdf';
    } else {
      path =
          '/storage/emulated/0/Download/pick_up_report-$initialPickUpDate-$finalPickUpDate.pdf';
    }
    var file = File(path);
    var bytes = <int>[];
    if (period == 'Daily') {
      bytes = await _pdfService.pickUpReport(list);
    } else {
      bytes = await _pdfService.pickUpReport(list,
          initialDate: initialPickUpDate, finalDate: finalPickUpDate);
    }
    file.writeAsBytesSync(bytes);
    return bytes;
  }

  @action
  Future<List<int>> _pickUpReportExcel(List<RentalReport> list) async {
    var path =
        '/storage/emulated/0/Download/daily_retrieval_report-$initialPickUpDate.pdf';
    var file = File(path);
    final bytes = await _pdfService.pickUpReport(list);
    file.writeAsBytesSync(bytes);
    return bytes;
  }
}
