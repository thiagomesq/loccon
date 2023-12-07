import 'package:loccon/core/models/client.dart';
import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/core/models/rental.dart';

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
