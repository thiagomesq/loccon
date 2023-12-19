import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dumpin/core/models/report_data.dart';
import 'package:dumpin/ui/shared/lc_app_bar.dart';
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
    return Scaffold(
      appBar: const LCAppBar(),
      body: SfPdfViewer.memory(Uint8List.fromList(reportData.bytes)),
    );
  }
}
