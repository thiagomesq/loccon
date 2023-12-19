import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/core/models/lc_user.dart';
import 'package:dumpin/ui/pages/home/home_page.dart';
import 'package:dumpin/ui/pages/login/login_controller.dart';
import 'package:dumpin/ui/pages/user/user_page.dart';
import 'package:dumpin/ui/shared/controller_provider.dart';
import 'package:dumpin/ui/shared/lc_future_button.dart';
import 'package:dumpin/ui/shared/lc_text_field.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  void onValidatedCodo(BuildContext context, LCUser? user) {
    if (user != null) {
      Navigator.of(context).pushReplacementNamed(UserPage.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ControllerScope(
      create: (_) => LoginController(
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
        GetIt.I(),
        onValidatedCodo,
      ),
      builder: (context, controller) {
        final sendSMSController = TextEditingController();
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 183.9954,
                  height: 133.33,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    return !controller.isCodeSent
                        ? LCTextField(
                            controller: sendSMSController,
                            keyboardType: TextInputType.phone,
                            labelText: 'Phone',
                            onChanged: (value) => controller.phone = value,
                          )
                        : LCTextField(
                            keyboardType: TextInputType.number,
                            labelText: 'SMS Code',
                            onChanged: (value) => controller.smsCode = value,
                          );
                  },
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return !controller.isCodeSent
                        ? LCFutureButton(
                            isValid: controller.isFormValid,
                            futureBuilder: (_) {
                              sendSMSController.clear();
                              return controller.sendCode();
                            },
                            child: const Text('Send SMS'),
                          )
                        : LCFutureButton(
                            isValid: controller.isSmsCodeValid,
                            futureBuilder: (_) =>
                                controller.validateCode(context),
                            child: const Text('Validate SMS'),
                          );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
