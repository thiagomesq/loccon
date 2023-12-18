import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:loccon/core/enums/report_type.dart';
import 'package:loccon/core/models/report_data.dart';
import 'package:loccon/ui/pages/reports/retrieval/retrieval_controller.dart';
import 'package:loccon/ui/pages/reports/pdf_viewer/pdf_viewer_page.dart';
import 'package:loccon/ui/shared/controller_provider.dart';
import 'package:loccon/ui/shared/lc_app_bar.dart';
import 'package:loccon/ui/shared/lc_dropdown_button.dart';
import 'package:loccon/ui/shared/lc_future_button.dart';
import 'package:loccon/ui/shared/lc_text_field.dart';

class RetrievalReportPage extends StatelessWidget {
  static const routeName = '/reports/retrieval';
  const RetrievalReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => DiaryRetrievalController(
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
        final items = controller.periods
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList();
        return Scaffold(
          appBar: const LCAppBar(),
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
                      'Retrieval Report',
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
                                return LCDropdownButton(
                                  labelText: 'Period',
                                  initialValue: controller.period,
                                  items: items,
                                  onChanged: (value) {
                                    controller.period = value;
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            controller.period == 'Daily'
                                ? Observer(
                                    builder: (_) {
                                      return LCTextField(
                                        controller: TextEditingController(),
                                        initialValue:
                                            controller.initialRetrievalDate,
                                        labelText: 'Retrieval Date *',
                                        isDatePicker: true,
                                        onChanged: (value) {
                                          controller.initialRetrievalDate =
                                              value;
                                        },
                                      );
                                    },
                                  )
                                : controller.period != 'Custom'
                                    ? Column(
                                        children: [
                                          Observer(
                                            builder: (_) {
                                              return LCTextField(
                                                controller:
                                                    TextEditingController(),
                                                initialValue: controller
                                                    .initialRetrievalDate,
                                                labelText:
                                                    'Initial Retrieval Date *',
                                                isDatePicker: true,
                                                onChanged: (value) {
                                                  controller
                                                          .initialRetrievalDate =
                                                      value;
                                                  DateTime date =
                                                      DateFormat('MM-dd-yyyy')
                                                          .parse(value);
                                                  switch (controller.period) {
                                                    case 'Weekly':
                                                      date = date.add(
                                                          const Duration(
                                                              days: 6));
                                                      break;
                                                    case 'Monthly':
                                                      date = date.add(
                                                          const Duration(
                                                              days: 30));
                                                      break;
                                                    case 'Yearly':
                                                      date = date.add(
                                                          const Duration(
                                                              days: 365));
                                                      break;
                                                    default:
                                                      break;
                                                  }
                                                  controller
                                                          .finalRetrievalDate =
                                                      DateFormat('MM-dd-yyyy')
                                                          .format(date);
                                                },
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          Observer(
                                            builder: (_) {
                                              DateTime date = DateFormat(
                                                      'MM-dd-yyyy')
                                                  .parse(controller
                                                      .initialRetrievalDate);
                                              switch (controller.period) {
                                                case 'Weekly':
                                                  date = date.add(
                                                      const Duration(days: 6));
                                                  break;
                                                case 'Monthly':
                                                  date = date.add(
                                                      const Duration(days: 30));
                                                  break;
                                                case 'Yearly':
                                                  date = date.add(
                                                      const Duration(
                                                          days: 365));
                                                  break;
                                                default:
                                                  break;
                                              }
                                              controller.finalRetrievalDate =
                                                  DateFormat('MM-dd-yyyy')
                                                      .format(date);
                                              return LCTextField(
                                                controller:
                                                    TextEditingController(),
                                                initialValue: controller
                                                    .finalRetrievalDate,
                                                labelText:
                                                    'Final Retrieval Date *',
                                                isDatePicker: true,
                                                onChanged: (value) {
                                                  controller
                                                          .finalRetrievalDate =
                                                      value;
                                                },
                                                isEnable: false,
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Observer(
                                            builder: (_) {
                                              return LCTextField(
                                                controller:
                                                    TextEditingController(),
                                                initialValue: controller
                                                    .initialRetrievalDate,
                                                labelText:
                                                    'Initial Retrieval Date *',
                                                isDatePicker: true,
                                                onChanged: (value) {
                                                  controller
                                                          .initialRetrievalDate =
                                                      value;
                                                },
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          Observer(
                                            builder: (_) {
                                              return LCTextField(
                                                controller:
                                                    TextEditingController(),
                                                initialValue: controller
                                                    .finalRetrievalDate,
                                                labelText:
                                                    'Final Retrieval Date *',
                                                isDatePicker: true,
                                                onChanged: (value) {
                                                  controller
                                                          .finalRetrievalDate =
                                                      value;
                                                },
                                              );
                                            },
                                          ),
                                        ],
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
                                controller.retrievalReport(ReportType.pdf),
                            onOk: (_, bytes) async {
                              await Navigator.of(context).pushNamed(
                                PdfViewerPage.routeName,
                                arguments: ReportData(
                                  bytes: bytes,
                                  screenOrientation: 'landscape',
                                ),
                              );

                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.portraitUp]);
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
