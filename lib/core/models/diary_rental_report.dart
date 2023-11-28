import 'package:loccon/core/models/client.dart';
import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/core/models/rental.dart';

class DailyRentalReport {
  final Rental rental;
  final Client client;
  final Dumpster dumpster;

  DailyRentalReport({
    required this.rental,
    required this.client,
    required this.dumpster,
  });
}
