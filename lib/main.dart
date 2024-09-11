import 'package:dumpin/di.dart';
import 'package:dumpin/ui/pages/splash/splash_page.dart';
import 'package:dumpin/ui/routes.dart';
import 'package:dumpin/ui/theme.dart';
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
