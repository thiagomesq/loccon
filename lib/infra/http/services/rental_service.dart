import 'package:loccon/core/enums/operator.dart';
import 'package:loccon/core/models/client.dart';
import 'package:loccon/core/models/diary_rental_report.dart';
import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/core/models/filtro.dart';
import 'package:loccon/core/models/rental.dart';
import 'package:loccon/infra/http/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

class RentalService {
  final FirestoreService _firestoreService;
  final collection = 'rentals';

  RentalService(this._firestoreService);

  Future<ObservableList<Rental>> getRentals() async {
    final list = await _firestoreService.getData(collection);
    return list.map((doc) => Rental.fromJson(doc)).toList().asObservable();
  }

  Future<List<Rental>> getRentalsByDumpsterId(String id) async {
    final list = await _firestoreService.getDataByFilters(
      collection,
      [
        Filtro(
          key: 'dumpster',
          operator: Operator.isEqualTo,
          value: id,
        ),
        Filtro(
          key: 'retrievalDate',
          operator: Operator.isNull,
          value: '',
        ),
      ],
    );
    return list.map((doc) {
      return Rental.fromJson(doc);
    }).toList();
  }

  Future<Rental> getRental(String id) async {
    final doc = await _firestoreService.getDataById(collection, id);
    return Rental.fromJson(doc);
  }

  Future<Rental> getRentalByDumpsterId(String id) async {
    final doc = await _firestoreService.getDataByFilters(
      collection,
      [
        Filtro(
          key: 'dumpster',
          operator: Operator.isEqualTo,
          value: id,
        ),
        Filtro(
          key: 'retrievalDate',
          operator: Operator.isEqualTo,
          value: null,
        ),
        Filtro(
          key: 'rentalDate',
          operator: Operator.isNotEqualTo,
          value: null,
        ),
      ],
    );
    return Rental.fromJson(doc.first);
  }

  Future<String> saveRental(Rental rental) async {
    return await _firestoreService.saveData(
      collection,
      rental.toJson(),
      rental.id!,
    );
  }

  Future<String> deleteRental(String id) async {
    return await _firestoreService.deleteData(collection, id);
  }

  Future<List<DailyRentalReport>> getDailyRentalReport(
    String date,
  ) async {
    final list = await _firestoreService.getDataByFilters(
      collection,
      [
        Filtro(
          key: 'rentalDate',
          operator: Operator.isEqualTo,
          value: date,
        ),
      ],
    );
    List<DailyRentalReport> dailyRentalReport = [];
    for (var e in list) {
      final client = Client.fromJson(
          (await _firestoreService.getDataById('clients', e['client'])));
      final dumpster = Dumpster.fromJson(
          (await _firestoreService.getDataById('dumpsters', e['dumpster'])));
      dailyRentalReport.add(DailyRentalReport(
        rental: Rental.fromJson(e),
        client: client,
        dumpster: dumpster,
      ));
    }
    return dailyRentalReport;
  }
}
