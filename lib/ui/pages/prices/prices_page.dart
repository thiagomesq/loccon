import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/ui/pages/prices/prices_controller.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_dialog.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';
import 'package:dumpin/ui/shared/lc_text_field.dart';

class PricesPage extends StatelessWidget {
  const PricesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ControllerScope(
      create: (_) => PricesController(
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
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
                          LCTextField(
                            labelText: 'Weekly Price *',
                            keyboardType: TextInputType.number,
                            initialValue:
                                controller.weeklyPrice?.toString() ?? '',
                            onChanged: (value) =>
                                controller.weeklyPrice = double.tryParse(value),
                          ),
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
