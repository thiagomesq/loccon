import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/core/enums/user_type.dart';
import 'package:dumpin/ui/pages/home/home_page.dart';
import 'package:dumpin/ui/pages/user/user_controller.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_app_bar.dart';
import 'package:dumpin/ui/shared/lc_fetch.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';
import 'package:dumpin/ui/shared/lc_text_field.dart';

class UserPage extends StatelessWidget {
  static const routeName = '/usuario';
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => UserController(
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
      ),
      builder: (context, controller) {
        return Scaffold(
          appBar: const LCAppBar(),
          body: Observer(
            builder: (_) {
              return LCFetch(
                future: controller.userLoading,
                onReload: () => controller.fetch(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Page',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        controller.isNewUser ? 'New User' : 'Edit User',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: Form(
                          child: ListView(
                            children: [
                              LCTextField(
                                labelText: 'Name',
                                initialValue: controller.username,
                                onChanged: (value) =>
                                    controller.username = value,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  ...UserType.values.map(
                                    (e) {
                                      return Expanded(
                                        child: Observer(
                                          builder: (_) {
                                            return RadioListTile<UserType>(
                                              title: Text(e.label),
                                              value: e,
                                              groupValue: controller.type,
                                              onChanged: (userType) =>
                                                  controller.type = userType,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Observer(builder: (_) {
                                return LCFutureButton(
                                  futureBuilder: (_) => controller.save(),
                                  isValid: controller.isFormValid,
                                  onOk: (_, __) {
                                    Navigator.of(context).pushReplacementNamed(
                                        HomePage.routeName);
                                  },
                                  child: const Text('Save'),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
