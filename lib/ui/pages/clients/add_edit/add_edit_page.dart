// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/core/enums/client_type.dart';
import 'package:dumpin/ui/pages/clients/add_edit/add_edit_controller.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_app_bar.dart';
import 'package:dumpin/ui/shared/lc_dialog.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';
import 'package:dumpin/ui/shared/lc_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddEditClientPage extends StatelessWidget {
  static const routeName = '/clients/add-edit';
  const AddEditClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => AddEditClientsController(
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
        final phoneMask = MaskTextInputFormatter(
          mask: '(###) ###-##-##',
          filter: {"#": RegExp(r'[0-9]')},
          initialText: controller.phone,
        );
        final businessPhoneMask = MaskTextInputFormatter(
          mask: '(###) ###-##-##',
          filter: {"#": RegExp(r'[0-9]')},
          initialText: controller.businessPhone,
        );
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
                      '${controller.client == null ? 'New' : 'Editing'} Client',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Form(
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...ClientType.values.map(
                                  (e) {
                                    return Expanded(
                                      child: Observer(
                                        builder: (_) {
                                          return RadioListTile<ClientType>(
                                            contentPadding: EdgeInsets.zero,
                                            title: Text(
                                              e.label,
                                            ),
                                            value: e,
                                            groupValue: controller.type,
                                            onChanged: (clientType) =>
                                                controller.type = clientType,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            controller.type == ClientType.company
                                ? LCTextField(
                                    labelText: 'Company',
                                    initialValue: controller.company,
                                    onChanged: (value) =>
                                        controller.company = value,
                                  )
                                : controller.type == ClientType.person
                                    ? LCTextField(
                                        labelText: 'Name',
                                        initialValue: controller.name,
                                        onChanged: (value) =>
                                            controller.name = value,
                                      )
                                    : const SizedBox.shrink(),
                            const SizedBox(height: 16),
                            LCTextField(
                              labelText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              initialValue: controller.email,
                              onChanged: (value) => controller.email = value,
                            ),
                            const SizedBox(height: 16),
                            LCTextField(
                              labelText: 'Phone',
                              keyboardType: TextInputType.phone,
                              initialValue: controller.phone,
                              onChanged: (value) =>
                                  controller.phone = phoneMask.getMaskedText(),
                              inputFormatters: [
                                phoneMask,
                              ],
                            ),
                            const SizedBox(height: 16),
                            LCTextField(
                              labelText: 'Business Phone',
                              keyboardType: TextInputType.phone,
                              initialValue: controller.businessPhone,
                              onChanged: (value) => controller.businessPhone =
                                  businessPhoneMask.getMaskedText(),
                              inputFormatters: [
                                businessPhoneMask,
                              ],
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
                                      textContent: 'Client saved successfully!',
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
