import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

import 'package:loccon/core/models/diary_rental_report.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' show get;

class PDFService {
  Future<List<int>> dailyRentalReport(List<DailyRentalReport> list) async {
    final PdfDocument document = PdfDocument();

    document.pageSettings.orientation = PdfPageOrientation.landscape;

    final PdfPageTemplateElement headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 56.70));

    final storageRef = FirebaseStorage.instance.ref();

    var response = await get(Uri.parse(
        await storageRef.child('images/escrita.png').getDownloadURL()));
    var data = response.bodyBytes;

    PdfBitmap image = PdfBitmap(data);

    headerTemplate.graphics.drawImage(
      image,
      const Rect.fromLTWH(0, 0, 200, 56.70),
    );

    document.template.top = headerTemplate;

    final titlePosition = Rect.fromLTWH(0, 20, document.pageSettings.width, 35);
    final titleTotalHeight = titlePosition.height + titlePosition.top;

    PdfPage page = document.pages.add();
    page.graphics.drawString(
      'Daily Rental Report',
      PdfStandardFont(PdfFontFamily.helvetica, 30),
      bounds: titlePosition,
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    page.graphics.drawString(
      'Date: ${list[0].rental.rentalDate}',
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.bold),
      bounds: Rect.fromLTWH(0, titleTotalHeight + 15, 515, 17),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    );

    PdfGrid grid = PdfGrid();

    grid.style = PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      cellPadding: PdfPaddings(left: 5, right: 5, top: 5, bottom: 5),
    );

    grid.columns.add(count: 4);

    grid.headers.add(1);

    final headerFontStyle =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Client';
    header.cells[0].style.font = headerFontStyle;
    header.cells[1].value = 'Rental Address';
    header.cells[1].style.font = headerFontStyle;
    header.cells[2].value = 'Container #';
    header.cells[2].style.font = headerFontStyle;
    header.cells[3].value = 'Capacity';
    header.cells[3].style.font = headerFontStyle;

    for (var item in list) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = item.client.name;
      row.cells[1].value =
          '${item.rental.number} ${item.rental.street}, ${item.rental.neighborhood}, ${item.rental.city}, ${item.rental.state} ${item.rental.zipCode}';
      row.cells[2].value = item.dumpster.code;
      row.cells[3].value = '${item.dumpster.size}Y';
    }

    grid.columns[0].width = 200;
    grid.columns[2].width = 77;
    grid.columns[3].width = 60;

    grid.draw(
      page: page,
      bounds: Rect.fromLTWH(0, titleTotalHeight + 35, 0, 0),
    );

    List<int> bytes = await document.save();
    document.dispose();
    return bytes;
  }
}
