import 'package:dumpin/core/models/client.dart';
import 'package:dumpin/core/models/dumpster.dart';
import 'package:dumpin/core/models/rental.dart';

class RentalReport {
  final Rental rental;
  final Client client;
  final Dumpster dumpster;

  RentalReport({
    required this.rental,
    required this.client,
    required this.dumpster,
  });
}
