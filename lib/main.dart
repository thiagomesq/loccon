import 'package:loccon/di.dart';
import 'package:loccon/ui/pages/splash/splash_page.dart';
import 'package:loccon/ui/routes.dart';
import 'package:loccon/ui/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      theme: theme,
      routes: routes,
      initialRoute: SplashPage.routeName,
    );
  }
}
