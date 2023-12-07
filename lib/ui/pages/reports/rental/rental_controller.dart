import 'dart:io';

import 'package:intl/intl.dart';
import 'package:loccon/core/enums/report_type.dart';
import 'package:loccon/core/models/rental_report.dart';
import 'package:loccon/infra/http/services/excel_service.dart';
import 'package:loccon/infra/http/services/pdf_service.dart';
import 'package:loccon/infra/http/services/rental_service.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:mobx/mobx.dart';

part 'rental_controller.g.dart';

class RentalController = RentalControllerBase with _$RentalController;

abstract class RentalControllerBase extends ControllerBase with Store {
  final RentalService _rentalService;
  final PDFService _pdfService;
  final ExcelService _excelService;

  RentalControllerBase(
    this._rentalService,
    this._pdfService,
    this._excelService,
  );

  @observable
  List<String> periods = ['Daily', 'Weekly', 'Monthly', 'Yearly', 'Custom'];

  @observable
  String period = 'Daily';

  @observable
  String initialRentalDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  @observable
  String finalRentalDate = DateFormat('MM-dd-yyyy')
      .format(DateTime.now().add(const Duration(days: 1)));

  @action
  Future<List<int>> rentalReport(ReportType reportType) async {
    var list = <RentalReport>[];
    if (period == 'Daily') {
      list = await _rentalService.getDailyRentalReport(initialRentalDate);
    } else {
      list = await _rentalService.getRentalReport(
        initialRentalDate,
        finalRentalDate,
      );
    }

    switch (reportType) {
      case ReportType.pdf:
        return await _rentalReportPDF(list);
      case ReportType.excel:
        return await _rentalReportExcel(list);
      default:
        return [];
    }
  }

  @action
  Future<List<int>> _rentalReportPDF(List<RentalReport> list) async {
    var path = '';
    if (period == 'Daily') {
      path =
          '/storage/emulated/0/Download/daily_rental_report-$initialRentalDate.pdf';
    } else {
      path =
          '/storage/emulated/0/Download/rental_report-$initialRentalDate-$finalRentalDate.pdf';
    }
    var file = File(path);
    var bytes = <int>[];
    if (period == 'Daily') {
      bytes = await _pdfService.rentalReport(list);
    } else {
      bytes = await _pdfService.rentalReport(list,
          initialDate: initialRentalDate, finalDate: finalRentalDate);
    }
    file.writeAsBytesSync(bytes);
    return bytes;
  }

  @action
  Future<List<int>> _rentalReportExcel(List<RentalReport> list) async {
    var path =
        '/storage/emulated/0/Download/daily_rental_report-$initialRentalDate.xlsx';
    var file = File(path);
    final bytes = await _pdfService.rentalReport(list);
    file.writeAsBytesSync(bytes);
    return bytes;
  }
}
