import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loccon/core/models/report_data.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  static const routeName = '/reports/pdf-viewer';
  const PdfViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    ReportData reportData =
        ModalRoute.of(context)!.settings.arguments as ReportData;
    switch (reportData.screenOrientation) {
      case 'landscape':
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeLeft]);
        break;
      default:
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        elevation: 15,
        title: Image.asset(
          'assets/images/escrita.png',
          height: 40,
        ),
      ),
      body: SfPdfViewer.memory(Uint8List.fromList(reportData.bytes)),
    );
  }
}
