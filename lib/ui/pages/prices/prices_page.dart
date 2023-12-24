import 'package:dumpin/ui/shared/lc_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/ui/pages/prices/prices_controller.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_dialog.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';
import 'package:dumpin/ui/shared/lc_text_field.dart';
import 'package:mobx/mobx.dart';

class PricesPage extends StatelessWidget {
  const PricesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controllerInitialRentalPrice = TextEditingController();
    return ControllerScope(
      create: (_) => PricesController(
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
        final sizeIems = controller.sizes!
            .map((size) => DropdownMenuItem(
                  value: size,
                  child: Text(size),
                ))
            .toList();
        controllerInitialRentalPrice.text =
            controller.initialRentalPrice![controller.size!].toString();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
          ),
          child: Observer(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Rental Prices',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Form(
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        children: [
                          Observer(builder: (_) {
                            return LCDropdownButton(
                              labelText: 'Size *',
                              items: sizeIems,
                              initialValue: controller.size,
                              onChanged: (value) {
                                controller.size = value;
                                controllerInitialRentalPrice.text = controller
                                    .initialRentalPrice![value]
                                    .toString();
                              },
                            );
                          }),
                          const SizedBox(height: 16),
                          Observer(builder: (_) {
                            return LCTextField(
                              labelText: 'Initial rental price *',
                              keyboardType: TextInputType.number,
                              controller: controllerInitialRentalPrice,
                              onChanged: (value) => controller
                                      .initialRentalPrice![controller.size!] =
                                  double.tryParse(value)!,
                            );
                          }),
                          const SizedBox(height: 16),
                          LCTextField(
                            labelText: 'Additional price per day *',
                            keyboardType: TextInputType.number,
                            initialValue:
                                controller.additionalPricePerDay?.toString() ??
                                    '',
                            onChanged: (value) => controller
                                .additionalPricePerDay = double.tryParse(value),
                          ),
                        ],
                      ),
                    ),
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
                            textContent: 'Rental prices saved successfully!',
                          );
                        },
                        child: const Text('Save'),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
