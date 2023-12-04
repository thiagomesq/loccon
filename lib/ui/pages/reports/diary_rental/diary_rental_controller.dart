import 'dart:io';

import 'package:intl/intl.dart';
import 'package:loccon/core/enums/report_type.dart';
import 'package:loccon/core/models/diary_rental_report.dart';
import 'package:loccon/infra/http/services/excel_service.dart';
import 'package:loccon/infra/http/services/pdf_service.dart';
import 'package:loccon/infra/http/services/rental_service.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:mobx/mobx.dart';

part 'diary_rental_controller.g.dart';

class DiaryRentalController = DiaryRentalControllerBase
    with _$DiaryRentalController;

abstract class DiaryRentalControllerBase extends ControllerBase with Store {
  final RentalService _rentalService;
  final PDFService _pdfService;
  final ExcelService _excelService;

  DiaryRentalControllerBase(
    this._rentalService,
    this._pdfService,
    this._excelService,
  );

  @observable
  String rentalDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  @action
  Future<List<int>> diaryRentalReport(ReportType reportType) async {
    final list = await _rentalService.getDailyRentalReport(rentalDate);

    switch (reportType) {
      case ReportType.pdf:
        return await _diaryRentalReportPDF(list);
      case ReportType.excel:
        return await _diaryRentalReportExcel(list);
      default:
        return [];
    }
  }

  @action
  Future<List<int>> _diaryRentalReportPDF(List<DailyRentalReport> list) async {
    var path =
        '/storage/emulated/0/Download/daily_rental_report-$rentalDate.pdf';
    var file = File(path);
    file.writeAsBytesSync(await _pdfService.dailyRentalReport(list));
    return _pdfService.dailyRentalReport(list);
  }

  @action
  Future<List<int>> _diaryRentalReportExcel(
      List<DailyRentalReport> list) async {
    var path =
        '/storage/emulated/0/Download/daily_rental_report-$rentalDate.pdf';
    var file = File(path);
    file.writeAsBytesSync(await _pdfService.dailyRentalReport(list));
    return _pdfService.dailyRentalReport(list);
  }
}
