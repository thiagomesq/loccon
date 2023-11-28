import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/core/models/rental.dart';
import 'package:mobx/mobx.dart';

class RentalStore with Store {
  @readonly
  Dumpster? _dumpster;

  Dumpster? get dumpster => _dumpster;

  Rental? _rental;

  Rental? get rental => _rental;

  @action
  void setDumpster(Dumpster? dumpster) {
    _dumpster = dumpster;
  }

  @action
  void setRental(Rental? rental) {
    _rental = rental;
  }

  @action
  void clear() {
    _dumpster = null;
  }

  @action
  void clearRental() {
    _rental = null;
  }
}
