import 'package:loccon/ui/pages/clients/add_edit/add_edit_page.dart';
import 'package:loccon/ui/pages/dumpsters/add_edit/add_edit_page.dart';
import 'package:loccon/ui/pages/home/home_page.dart';
import 'package:loccon/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:loccon/ui/pages/rental/add_edit/add_edit_page.dart';
import 'package:loccon/ui/pages/rental/part/dumpster_rental_info_page.dart';
import 'package:loccon/ui/pages/reports/diary_rental/diary_rental_page.dart';
import 'package:loccon/ui/pages/reports/diary_retrieval/diary_retrieval_page.dart';
import 'package:loccon/ui/pages/reports/pdf_viewer/pdf_viewer_page.dart';
import 'package:loccon/ui/pages/splash/splash_page.dart';
import 'package:loccon/ui/pages/user/user_page.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  SplashPage.routeName: (_) => const SplashPage(),
  LoginPage.routeName: (_) => const LoginPage(),
  UserPage.routeName: (_) => const UserPage(),
  HomePage.routeName: (_) => const HomePage(),
  AddEditClientPage.routeName: (_) => const AddEditClientPage(),
  AddEditDumpsterPage.routeName: (_) => const AddEditDumpsterPage(),
  DumpsterRentalInfoPage.routeName: (_) => const DumpsterRentalInfoPage(),
  AddEditRentalPage.routeName: (_) => const AddEditRentalPage(),
  DiaryRentalReportPage.routeName: (_) => const DiaryRentalReportPage(),
  DiaryRetrievalReportPage.routeName: (_) => const DiaryRetrievalReportPage(),
  PdfViewerPage.routeName: (_) => const PdfViewerPage(),
};
