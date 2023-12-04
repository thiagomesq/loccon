import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  static const routeName = '/reports/pdf-viewer';
  const PdfViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> bytes = ModalRoute.of(context)!.settings.arguments as List<int>;
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
      body: SfPdfViewer.memory(Uint8List.fromList(bytes)),
    );
  }
}
