import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:loccon/core/models/client.dart';

import 'package:loccon/core/models/rental_report.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' show get;

class PDFService {
  //rentalReport
  Future<List<int>> rentalReport(
    List<RentalReport> list, {
    String? initialDate,
    String? finalDate,
  }) async {
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
    if (initialDate != null && finalDate != null) {
      page.graphics.drawString(
        'Rental Report',
        PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: titlePosition,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );
    } else {
      page.graphics.drawString(
        'Daily Rental Report',
        PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: titlePosition,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );
    }

    if (list.isNotEmpty) {
      if (initialDate != null && finalDate != null) {
        page.graphics.drawString(
          'Period: $initialDate - $finalDate',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTWH(0, titleTotalHeight + 15, 515, 17),
          brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        );
      } else {
        page.graphics.drawString(
          'Date: ${list[0].rental.rentalDate}',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTWH(0, titleTotalHeight + 15, 515, 17),
          brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        );
      }

      PdfGrid grid = PdfGrid();

      grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        cellPadding: PdfPaddings(left: 5, right: 5, top: 5, bottom: 5),
      );

      if (initialDate != null && finalDate != null) {
        grid.columns.add(count: 5);
      } else {
        grid.columns.add(count: 4);
      }

      grid.headers.add(1);

      final headerFontStyle = PdfStandardFont(PdfFontFamily.helvetica, 12,
          style: PdfFontStyle.bold);

      PdfGridRow header = grid.headers[0];
      if (initialDate != null && finalDate != null) {
        header.cells[0].value = 'Client';
        header.cells[0].style.font = headerFontStyle;
        header.cells[1].value = 'Rantal Date';
        header.cells[1].style.font = headerFontStyle;
        header.cells[2].value = 'Rental Address';
        header.cells[2].style.font = headerFontStyle;
        header.cells[3].value = 'Container #';
        header.cells[3].style.font = headerFontStyle;
        header.cells[4].value = 'Capacity';
        header.cells[4].style.font = headerFontStyle;
      } else {
        header.cells[0].value = 'Client';
        header.cells[0].style.font = headerFontStyle;
        header.cells[1].value = 'Rental Address';
        header.cells[1].style.font = headerFontStyle;
        header.cells[2].value = 'Container #';
        header.cells[2].style.font = headerFontStyle;
        header.cells[3].value = 'Capacity';
        header.cells[3].style.font = headerFontStyle;
      }

      for (var item in list) {
        PdfGridRow row = grid.rows.add();
        if (initialDate != null && finalDate != null) {
          row.cells[0].value = item.client.name;
          row.cells[1].value = item.rental.rentalDate;
          row.cells[2].value =
              '${item.rental.number} ${item.rental.street}, ${item.rental.neighborhood}, ${item.rental.city}, ${item.rental.state} ${item.rental.zipCode}';
          row.cells[3].value = item.dumpster.code;
          row.cells[4].value = '${item.dumpster.size}Y';
        } else {
          row.cells[0].value = item.client.name;
          row.cells[1].value =
              '${item.rental.number} ${item.rental.street}, ${item.rental.neighborhood}, ${item.rental.city}, ${item.rental.state} ${item.rental.zipCode}';
          row.cells[2].value = item.dumpster.code;
          row.cells[3].value = '${item.dumpster.size}Y';
        }
      }

      if (initialDate != null && finalDate != null) {
        grid.columns[0].width = 200;
        grid.columns[1].width = 77;
        grid.columns[3].width = 77;
        grid.columns[4].width = 60;
      } else {
        grid.columns[0].width = 200;
        grid.columns[2].width = 77;
        grid.columns[3].width = 60;
      }

      grid.draw(
        page: page,
        bounds: Rect.fromLTWH(0, titleTotalHeight + 35, 0, 0),
      );
    } else {
      page.graphics.drawString(
        'No data found',
        PdfStandardFont(PdfFontFamily.helvetica, 22, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
          0,
          titleTotalHeight + 30,
          document.pageSettings.width,
          30,
        ),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );
    }

    List<int> bytes = await document.save();
    document.dispose();
    return bytes;
  }

  //retrievalReport
  Future<List<int>> retrievalReport(
    List<RentalReport> list, {
    String? initialDate,
    String? finalDate,
  }) async {
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
    if (initialDate != null && finalDate != null) {
      page.graphics.drawString(
        'Retrieval Report',
        PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: titlePosition,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );
    } else {
      page.graphics.drawString(
        'Daily Retrieval Report',
        PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: titlePosition,
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );
    }

    if (list.isNotEmpty) {
      if (initialDate != null && finalDate != null) {
        page.graphics.drawString(
          'Period: $initialDate - $finalDate',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTWH(0, titleTotalHeight + 15, 515, 17),
          brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        );
      } else {
        page.graphics.drawString(
          'Date: $initialDate',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTWH(0, titleTotalHeight + 15, 515, 17),
          brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        );
      }

      PdfGrid grid = PdfGrid();

      grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        cellPadding: PdfPaddings(left: 5, right: 5, top: 5, bottom: 5),
      );

      if (initialDate != null && finalDate != null) {
        grid.columns.add(count: 4);
      } else {
        grid.columns.add(count: 3);
      }

      grid.headers.add(1);

      final headerFontStyle = PdfStandardFont(PdfFontFamily.helvetica, 12,
          style: PdfFontStyle.bold);

      PdfGridRow header = grid.headers[0];
      if (initialDate != null && finalDate != null) {
        header.cells[0].value = 'Client';
        header.cells[0].style.font = headerFontStyle;
        header.cells[1].value = 'Retrieval Date';
        header.cells[1].style.font = headerFontStyle;
        header.cells[2].value = 'Retrieval Address';
        header.cells[2].style.font = headerFontStyle;
        header.cells[3].value = 'Container #';
        header.cells[3].style.font = headerFontStyle;
      } else {
        header.cells[0].value = 'Client';
        header.cells[0].style.font = headerFontStyle;
        header.cells[1].value = 'Retrieval Address';
        header.cells[1].style.font = headerFontStyle;
        header.cells[2].value = 'Container #';
        header.cells[2].style.font = headerFontStyle;
      }

      for (var item in list) {
        PdfGridRow row = grid.rows.add();
        if (initialDate != null && finalDate != null) {
          row.cells[0].value = item.client.name;
          row.cells[1].value = item.rental.retrievalDate;
          row.cells[2].value =
              '${item.rental.number} ${item.rental.street}, ${item.rental.neighborhood}, ${item.rental.city}, ${item.rental.state} ${item.rental.zipCode}';
          row.cells[3].value = item.dumpster.code;
        } else {
          row.cells[0].value = item.client.name;
          row.cells[1].value =
              '${item.rental.number} ${item.rental.street}, ${item.rental.neighborhood}, ${item.rental.city}, ${item.rental.state} ${item.rental.zipCode}';
          row.cells[3].value = item.dumpster.code;
        }
      }

      if (initialDate != null && finalDate != null) {
        grid.columns[0].width = 200;
        grid.columns[1].width = 90;
        grid.columns[3].width = 77;
      } else {
        grid.columns[0].width = 200;
        grid.columns[2].width = 77;
      }

      grid.draw(
        page: page,
        bounds: Rect.fromLTWH(0, titleTotalHeight + 35, 0, 0),
      );
    } else {
      page.graphics.drawString(
        'No data found',
        PdfStandardFont(PdfFontFamily.helvetica, 22, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
          0,
          titleTotalHeight + 30,
          document.pageSettings.width,
          30,
        ),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );
    }

    List<int> bytes = await document.save();
    document.dispose();
    return bytes;
  }

  //clientReport
  Future<List<int>> clientReport(
    List<Client> list, {
    String? initialDate,
    String? finalDate,
  }) async {
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

    const titlePosition = Rect.fromLTWH(0, 20, 515, 35);
    final titleTotalHeight = titlePosition.height + titlePosition.top;

    PdfPage page = document.pages.add();
    page.graphics.drawString(
      'Client Report',
      PdfStandardFont(PdfFontFamily.helvetica, 30),
      bounds: titlePosition,
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    );

    if (list.isNotEmpty) {
      if (initialDate != null && finalDate != null) {
        page.graphics.drawString(
          'Period: $initialDate - $finalDate',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.bold),
          bounds: Rect.fromLTWH(0, titleTotalHeight + 15, 515, 17),
          brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        );
      }
      PdfGrid grid = PdfGrid();

      grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        cellPadding: PdfPaddings(left: 5, right: 5, top: 5, bottom: 5),
      );

      grid.columns.add(count: 4);

      grid.headers.add(1);

      final headerFontStyle = PdfStandardFont(PdfFontFamily.helvetica, 12,
          style: PdfFontStyle.bold);

      PdfGridRow header = grid.headers[0];
      header.cells[0].value = 'Name/Company';
      header.cells[0].style.font = headerFontStyle;
      header.cells[1].value = 'Email';
      header.cells[1].style.font = headerFontStyle;
      header.cells[2].value = 'Phone';
      header.cells[2].style.font = headerFontStyle;
      header.cells[3].value = 'Contact';
      header.cells[3].style.font = headerFontStyle;

      for (var item in list) {
        PdfGridRow row = grid.rows.add();
        row.cells[0].value = item.name ?? item.company;
        row.cells[1].value = item.email ?? '';
        row.cells[2].value = item.phone;
        row.cells[3].value = item.contact ?? '';
      }

      grid.columns[1].width = 170;
      grid.columns[2].width = 96;
      grid.columns[3].width = 96;

      grid.draw(
        page: page,
        bounds: Rect.fromLTWH(0, titleTotalHeight + 35, 0, 0),
      );
    } else {
      page.graphics.drawString(
        'No data found',
        PdfStandardFont(PdfFontFamily.helvetica, 22, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(0, titleTotalHeight + 30, 515, 30),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );
    }
    List<int> bytes = await document.save();
    document.dispose();
    return bytes;
  }
}
