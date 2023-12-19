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
  List<String> periods = ['Daily', 'Weekly', 'Monthly', 'Yearly', 'Custom'];

  @observable
  String period = 'Daily';

  @observable
  String initialRetrievalDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  @observable
  String finalRetrievalDate = DateFormat('MM-dd-yyyy')
      .format(DateTime.now().add(const Duration(days: 1)));

  @action
  Future<List<int>> retrievalReport(ReportType reportType) async {
    var list = <RentalReport>[];
    if (period == 'Daily') {
      list = await _rentalService.getDailyRetrievalReport(initialRetrievalDate);
    } else {
      list = await _rentalService.getRetrievalReport(
        initialRetrievalDate,
        finalRetrievalDate,
      );
    }

    switch (reportType) {
      case ReportType.pdf:
        return await _retrievalReportPDF(list);
      case ReportType.excel:
        return await _retrievalReportExcel(list);
      default:
        return [];
    }
  }

  @action
  Future<List<int>> _retrievalReportPDF(List<RentalReport> list) async {
    var path = '';
    if (period == 'Daily') {
      path =
          '/storage/emulated/0/Download/daily_retrieval_report-$initialRetrievalDate.pdf';
    } else {
      path =
          '/storage/emulated/0/Download/retrieval_report-$initialRetrievalDate-$finalRetrievalDate.pdf';
    }
    var file = File(path);
    var bytes = <int>[];
    if (period == 'Daily') {
      bytes = await _pdfService.pickUpReport(list);
    } else {
      bytes = await _pdfService.pickUpReport(list,
          initialDate: initialRetrievalDate, finalDate: finalRetrievalDate);
    }
    file.writeAsBytesSync(bytes);
    return bytes;
  }

  @action
  Future<List<int>> _retrievalReportExcel(List<RentalReport> list) async {
    var path =
        '/storage/emulated/0/Download/daily_retrieval_report-$initialRetrievalDate.pdf';
    var file = File(path);
    final bytes = await _pdfService.pickUpReport(list);
    file.writeAsBytesSync(bytes);
    return bytes;
  }
}
