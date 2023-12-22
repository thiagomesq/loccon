import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:dumpin/core/enums/report_type.dart';
import 'package:dumpin/core/models/dumpster.dart';
import 'package:dumpin/core/models/report_data.dart';
import 'package:dumpin/ui/pages/reports/dumpster_utilization/dumpster_utilization_controller.dart';
import 'package:dumpin/ui/pages/reports/pdf_viewer/pdf_viewer_page.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_app_bar.dart';
import 'package:dumpin/ui/shared/lc_dropdown_button.dart';
import 'package:dumpin/ui/shared/lc_fetch.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';
import 'package:dumpin/ui/shared/lc_text_field.dart';
import 'package:dumpin/ui/shared/lc_type_ahead_field.dart';

class DumpsterUtilizationPage extends StatelessWidget {
  static const String routeName = '/reports/dumpster-utilization';
  const DumpsterUtilizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => DumpsterUtilizationController(
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
        final periodItems = controller.periods
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
                return LCFetch(
                  future: controller.dumpstersLoading,
                  onReload: () => controller.fetch(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Dumpster Utilization Report',
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
                                    items: periodItems,
                                    onChanged: (value) {
                                      controller.period = value;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              controller.period != 'Custom'
                                  ? Column(
                                      children: [
                                        Observer(
                                          builder: (_) {
                                            return LCTextField(
                                              controller:
                                                  TextEditingController(),
                                              initialValue:
                                                  controller.initialDate,
                                              labelText: 'Initial Date *',
                                              isDatePicker: true,
                                              onChanged: (value) {
                                                controller.initialDate = value;
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
                                                controller.finalDate =
                                                    DateFormat('MM-dd-yyyy')
                                                        .format(date);
                                              },
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 16),
                                        Observer(
                                          builder: (_) {
                                            DateTime date =
                                                DateFormat('MM-dd-yyyy').parse(
                                                    controller.initialDate);
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
                                                    const Duration(days: 365));
                                                break;
                                              default:
                                                break;
                                            }
                                            controller.finalDate =
                                                DateFormat('MM-dd-yyyy')
                                                    .format(date);
                                            return LCTextField(
                                              controller:
                                                  TextEditingController(),
                                              initialValue:
                                                  controller.finalDate,
                                              labelText: 'Final Date *',
                                              isDatePicker: true,
                                              onChanged: (value) {
                                                controller.finalDate = value;
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
                                              initialValue:
                                                  controller.initialDate,
                                              labelText: 'Initial Date *',
                                              isDatePicker: true,
                                              onChanged: (value) {
                                                controller.initialDate = value;
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
                                              initialValue:
                                                  controller.finalDate,
                                              labelText: 'Final Date *',
                                              isDatePicker: true,
                                              onChanged: (value) {
                                                controller.finalDate = value;
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                              const SizedBox(height: 16),
                              Observer(
                                builder: (_) {
                                  return LCDropdownButton(
                                    labelText: 'Size',
                                    initialValue: controller.size,
                                    items: controller.sizes
                                            ?.map(
                                              (e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ),
                                            )
                                            .toList() ??
                                        [],
                                    onChanged: (value) {
                                      controller.size = value;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              controller.size == 'Unique'
                                  ? Observer(
                                      builder: (_) {
                                        return LCTypeAheadField<Dumpster>(
                                          labelText: 'Dumpster',
                                          initialValue: controller.dumpster !=
                                                  null
                                              ? '${controller.dumpster?.code!} - ${controller.dumpster?.size}Y'
                                              : null,
                                          onSuggestionSelected: (suggestion) {
                                            controller.dumpster = suggestion;
                                          },
                                          itemBuilder: (context, suggestion) {
                                            return ListTile(
                                              title: Text(
                                                  '${suggestion.code!} - ${suggestion.size}Y'),
                                            );
                                          },
                                          suggestionsCallback: (pattern) {
                                            if (controller.dumpsters == null ||
                                                controller.dumpsters!.isEmpty) {
                                              return [];
                                            }
                                            return controller.dumpsters!
                                                .where((client) =>
                                                    client.code!
                                                        .toLowerCase()
                                                        .contains(pattern
                                                            .toLowerCase()) ||
                                                    client.size
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(pattern
                                                            .toLowerCase()))
                                                .map((client) => client);
                                          },
                                        );
                                      },
                                    )
                                  : const SizedBox.shrink(),
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
                              futureBuilder: (_) => controller
                                  .dumpsterUtilizationReport(ReportType.pdf),
                              isValid: controller.isFormValid,
                              onOk: (_, bytes) async {
                                await Navigator.of(context).pushNamed(
                                  PdfViewerPage.routeName,
                                  arguments: ReportData(
                                    bytes: bytes,
                                    screenOrientation: 'portrait',
                                  ),
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
                                  controller.dumpsterUtilizationReport(ReportType.excel),
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
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
