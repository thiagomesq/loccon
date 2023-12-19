// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/ui/pages/dumpsters/add_edit/add_edit_controller.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_app_bar.dart';
import 'package:dumpin/ui/shared/lc_dialog.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';
import 'package:dumpin/ui/shared/lc_text_field.dart';

class AddEditDumpsterPage extends StatelessWidget {
  static const routeName = '/dumpsters/add-edit';
  const AddEditDumpsterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => AddEditDumpstersController(
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.dumpster == null ? 'New' : 'Editing'} Dumpster',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Form(
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            LCTextField(
                              labelText: 'Code *',
                              keyboardType: TextInputType.number,
                              initialValue: controller.code,
                              onChanged: (value) => controller.code = value,
                            ),
                            const SizedBox(height: 16),
                            LCTextField(
                              labelText: 'Size *',
                              keyboardType: TextInputType.number,
                              initialValue: controller.size?.toString() ?? '',
                              onChanged: (value) => controller.size =
                                  value != '' ? int.parse(value) : 0,
                            ),
                            const SizedBox(height: 16),
                            Observer(
                              builder: (_) {
                                return LCFutureButton(
                                  futureBuilder: (_) => controller.save(),
                                  isValid: controller.isFormValid,
                                  onOk: (_, __) async {
                                    await showAlert(
                                      context: context,
                                      title: 'Success',
                                      textContent:
                                          'Dumpster saved successfully!',
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Save'),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
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
