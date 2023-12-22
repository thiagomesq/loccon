import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/core/models/client.dart';
import 'package:dumpin/ui/pages/rental/add_edit/add_edit_controller.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_app_bar.dart';
import 'package:dumpin/ui/shared/lc_fetch.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';
import 'package:dumpin/ui/shared/lc_text_field.dart';
import 'package:dumpin/ui/shared/lc_type_ahead_field.dart';

class AddEditRentalPage extends StatelessWidget {
  static const String routeName = '/rental/add-edit';
  const AddEditRentalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => AddEditRentalController(
        GetIt.I(),
        GetIt.I(),
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
                return LCFetch(
                  future: controller.clientsLoading,
                  onReload: () => controller.fetch(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${controller.rental == null ? 'New' : 'Editing'} Rental',
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
                                  return LCTypeAheadField<Client>(
                                    labelText: 'Client *',
                                    initialValue: controller.client?.name,
                                    onSuggestionSelected: (suggestion) {
                                      controller.client = suggestion;
                                    },
                                    itemBuilder: (context, suggestion) {
                                      return ListTile(
                                        title: Text(suggestion.name!),
                                      );
                                    },
                                    suggestionsCallback: (pattern) {
                                      if (controller.clients.isEmpty) {
                                        return [];
                                      }
                                      return controller.clients
                                          .where((client) => client.name!
                                              .toLowerCase()
                                              .contains(pattern.toLowerCase()))
                                          .map((client) => client)
                                          .toList();
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              Observer(
                                builder: (_) {
                                  return LCTextField(
                                    controller: TextEditingController(),
                                    initialValue: controller.rentalDate,
                                    labelText: 'Rental Date *',
                                    isDatePicker: true,
                                    firstDate: DateTime.now(),
                                    onChanged: (value) {
                                      controller.rentalDate = value;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              Observer(
                                builder: (_) {
                                  return LCTextField(
                                    labelText: 'Street *',
                                    keyboardType: TextInputType.streetAddress,
                                    initialValue:
                                        controller.street?.toString() ?? '',
                                    onChanged: (value) {
                                      controller.street = value;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              LCTextField(
                                labelText: 'Number *',
                                initialValue: controller.number ?? '',
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  controller.number = value;
                                },
                              ),
                              const SizedBox(height: 16),
                              LCTextField(
                                labelText: 'Neighborhood *',
                                initialValue: controller.neighborhood ?? '',
                                onChanged: (value) {
                                  controller.neighborhood = value;
                                },
                              ),
                              const SizedBox(height: 16),
                              LCTextField(
                                labelText: 'City *',
                                initialValue: controller.city ?? '',
                                onChanged: (value) {
                                  controller.city = value;
                                },
                              ),
                              const SizedBox(height: 16),
                              LCTextField(
                                labelText: 'State *',
                                initialValue: controller.state ?? '',
                                onChanged: (value) {
                                  controller.state = value;
                                },
                              ),
                              const SizedBox(height: 16),
                              LCTextField(
                                labelText: 'Zip Code *',
                                initialValue: controller.zipCode ?? '',
                                onChanged: (value) {
                                  controller.zipCode = value;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      LCFutureButton(
                        futureBuilder: (_) => controller.save(),
                        isValid: controller.isFormValid,
                        onOk: (_, __) {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save'),
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
