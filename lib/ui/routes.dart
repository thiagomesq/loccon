import 'package:dumpin/ui/pages/clients/add_edit/add_edit_page.dart';
import 'package:dumpin/ui/pages/dumpsters/add_edit/add_edit_page.dart';
import 'package:dumpin/ui/pages/home/home_page.dart';
import 'package:dumpin/ui/pages/login/login_page.dart';
import 'package:dumpin/ui/pages/reports/customer_history/customer_history_page.dart';
import 'package:flutter/material.dart';
import 'package:dumpin/ui/pages/rental/add_edit/add_edit_page.dart';
import 'package:dumpin/ui/pages/rental/part/dumpster_rental_info_page.dart';
import 'package:dumpin/ui/pages/reports/client/client_page.dart';
import 'package:dumpin/ui/pages/reports/dumpster_utilization/dumpster_utilization_page.dart';
import 'package:dumpin/ui/pages/reports/rental/rental_page.dart';
import 'package:dumpin/ui/pages/reports/pick_up/pick_up_page.dart';
import 'package:dumpin/ui/pages/reports/pdf_viewer/pdf_viewer_page.dart';
import 'package:dumpin/ui/pages/splash/splash_page.dart';
import 'package:dumpin/ui/pages/user/user_page.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  SplashPage.routeName: (_) => const SplashPage(),
  LoginPage.routeName: (_) => const LoginPage(),
  UserPage.routeName: (_) => const UserPage(),
  HomePage.routeName: (_) => const HomePage(),
  AddEditClientPage.routeName: (_) => const AddEditClientPage(),
  AddEditDumpsterPage.routeName: (_) => const AddEditDumpsterPage(),
  DumpsterRentalInfoPage.routeName: (_) => const DumpsterRentalInfoPage(),
  AddEditRentalPage.routeName: (_) => const AddEditRentalPage(),
  RentalReportPage.routeName: (_) => const RentalReportPage(),
  PickUpReportPage.routeName: (_) => const PickUpReportPage(),
  ClientReportPage.routeName: (_) => const ClientReportPage(),
  PdfViewerPage.routeName: (_) => const PdfViewerPage(),
  DumpsterUtilizationPage.routeName: (_) => const DumpsterUtilizationPage(),
  CustomerHistoryPage.routeName: (_) => const CustomerHistoryPage(),
};
