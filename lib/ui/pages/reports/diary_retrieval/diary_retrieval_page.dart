import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loccon/core/enums/report_type.dart';
import 'package:loccon/ui/pages/reports/diary_retrieval/diary_retrieval_controller.dart';
import 'package:loccon/ui/pages/reports/pdf_viewer/pdf_viewer_page.dart';
import 'package:loccon/ui/shared/controller_provider.dart';
import 'package:loccon/ui/shared/lc_future_button.dart';
import 'package:loccon/ui/shared/lc_text_field.dart';

class DiaryRetrievalReportPage extends StatelessWidget {
  static const routeName = '/reports/diary-retrieval';
  const DiaryRetrievalReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => DiaryRetrievalController(
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            child: Observer(
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Diary Retrieval Report',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Form(
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            Observer(
                              builder: (_) {
                                return LCTextField(
                                  controller: TextEditingController(),
                                  initialValue: controller.retrievalDate,
                                  labelText: 'Retrieval Date *',
                                  isDatePicker: true,
                                  onChanged: (value) {
                                    controller.retrievalDate = value;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: LCFutureButton<dynamic>(
                            futureBuilder: (_) =>
                                controller.diaryRetrievalReport(ReportType.pdf),
                            onOk: (_, bytes) {
                              Navigator.of(context).pushNamed(
                                PdfViewerPage.routeName,
                                arguments: bytes,
                              );
                            },
                            backgroundColor: const Color(0XFF9E0000),
                            foregroundColor: Colors.white,
                            child: const Text('PDF'),
                          ),
                        ),
                        /*const SizedBox(width: 10),
                        Expanded(
                          child: LCFutureButton<dynamic>(
                            futureBuilder: (_) =>
                                controller.diaryRetrievalReport(ReportType.excel),
                            onOk: (_, bytes) {
                              Navigator.of(context).pushNamed(
                                PdfViewerPage.routeName,
                                arguments: bytes,
                              );
                            },
                            backgroundColor: const Color(0XFF1D6F42),
                            foregroundColor: Colors.white,
                            child: const Text('Excel'),
                          ),
                        ),*/
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
