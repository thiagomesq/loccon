import 'dart:io';
import 'dart:ui';

import 'package:loccon/core/models/diary_rental_report.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PDFService {
  Future<List<int>> dailyRentalReport(List<DailyRentalReport> list) async {
    final PdfDocument document = PdfDocument();

    final PdfPageTemplateElement headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));

    headerTemplate.graphics.drawImage(
        PdfBitmap(File('assets/image/image.jpg').readAsBytesSync()),
        const Rect.fromLTWH(0, 15, 100, 28.35));

    document.template.top = headerTemplate;

    PdfPage page = document.pages.add();
    page.graphics.drawString(
      'Daily Rental Report',
      PdfStandardFont(PdfFontFamily.helvetica, 30),
      bounds: const Rect.fromLTWH(0, 0, 515, 50),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    List<int> bytes = await document.save();
    document.dispose();
    return bytes;
  }
}
