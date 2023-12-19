import 'package:flutter/material.dart';
import 'package:dumpin/ui/pages/reports/client/client_page.dart';
import 'package:dumpin/ui/pages/reports/dumpster_utilization/dumpster_utilization_page.dart';
import 'package:dumpin/ui/pages/reports/rental/rental_page.dart';
import 'package:dumpin/ui/pages/reports/retrieval/retrieval_page.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Reports',
            style: theme.textTheme.titleLarge,
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: const [
                ReportButton(
                  route: RentalReportPage.routeName,
                  text: 'Rental Report',
                ),
                ReportButton(
                  route: RetrievalReportPage.routeName,
                  text: 'Retrieval Report',
                ),
                ReportButton(
                  route: ClientReportPage.routeName,
                  text: 'Clients Report',
                ),
                ReportButton(
                  route: DumpsterUtilizationPage.routeName,
                  text: 'Dumpster Utilization Report',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReportButton extends StatelessWidget {
  final String text;
  final String route;
  const ReportButton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(11.0),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(
            horizontal: 5,
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          Theme.of(context).textTheme.bodyLarge!,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.surface,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
              width: 3.0,
            ),
          ),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
