import 'dart:io';

import 'package:intl/intl.dart';
import 'package:loccon/core/enums/report_type.dart';
import 'package:loccon/core/models/rental_report.dart';
import 'package:loccon/infra/http/services/excel_service.dart';
import 'package:loccon/infra/http/services/pdf_service.dart';
import 'package:loccon/infra/http/services/rental_service.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:mobx/mobx.dart';

part 'diary_retrieval_controller.g.dart';

class DiaryRetrievalController = DiaryRetrievalControllerBase
    with _$DiaryRetrievalController;

abstract class DiaryRetrievalControllerBase extends ControllerBase with Store {
  final RentalService _rentalService;
  final PDFService _pdfService;
  final ExcelService _excelService;

  DiaryRetrievalControllerBase(
    this._rentalService,
    this._pdfService,
    this._excelService,
  );

  @observable
  String retrievalDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  @action
  Future<List<int>> diaryRetrievalReport(ReportType reportType) async {
    final list = await _rentalService.getDailyRetrievalReport(retrievalDate);

    switch (reportType) {
      case ReportType.pdf:
        return await _diaryRetrievalReportPDF(list);
      case ReportType.excel:
        return await _diaryRetrievalReportExcel(list);
      default:
        return [];
    }
  }

  @action
  Future<List<int>> _diaryRetrievalReportPDF(List<RentalReport> list) async {
    var path =
        '/storage/emulated/0/Download/daily_retrieval_report-$retrievalDate.pdf';
    var file = File(path);
    final bytes = await _pdfService.dailyRetrievalReport(list);
    file.writeAsBytesSync(bytes);
    return bytes;
  }

  @action
  Future<List<int>> _diaryRetrievalReportExcel(List<RentalReport> list) async {
    var path =
        '/storage/emulated/0/Download/daily_retrieval_report-$retrievalDate.pdf';
    var file = File(path);
    final bytes = await _pdfService.dailyRetrievalReport(list);
    file.writeAsBytesSync(bytes);
    return bytes;
  }
}
