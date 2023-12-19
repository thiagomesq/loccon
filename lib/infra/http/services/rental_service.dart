import 'package:dumpin/core/enums/operator.dart';
import 'package:dumpin/core/models/client.dart';
import 'package:dumpin/core/models/rental_report.dart';
import 'package:dumpin/core/models/dumpster.dart';
import 'package:dumpin/core/models/filtro.dart';
import 'package:dumpin/core/models/rental.dart';
import 'package:dumpin/infra/http/services/firestore_service.dart';
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

  Future<List<RentalReport>> getDailyRentalReport(
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
    List<RentalReport> dailyRentalReport = [];
    for (var e in list) {
      final client = Client.fromJson(
          (await _firestoreService.getDataById('clients', e['client'])));
      final dumpster = Dumpster.fromJson(
          (await _firestoreService.getDataById('dumpsters', e['dumpster'])));
      dailyRentalReport.add(RentalReport(
        rental: Rental.fromJson(e),
        client: client,
        dumpster: dumpster,
      ));
    }
    return dailyRentalReport;
  }

  Future<List<RentalReport>> getRentalReport(
    String initialDate,
    String finalDate,
  ) async {
    final list = await _firestoreService.getDataByFilters(
      collection,
      [
        Filtro(
          key: 'rentalDate',
          operator: Operator.isGreaterThanOrEqualTo,
          value: initialDate,
        ),
        Filtro(
          key: 'rentalDate',
          operator: Operator.isLessThanOrEqualTo,
          value: finalDate,
        ),
      ],
    );
    List<RentalReport> rentalReport = [];
    for (var e in list) {
      final client = Client.fromJson(
          (await _firestoreService.getDataById('clients', e['client'])));
      final dumpster = Dumpster.fromJson(
          (await _firestoreService.getDataById('dumpsters', e['dumpster'])));
      rentalReport.add(RentalReport(
        rental: Rental.fromJson(e),
        client: client,
        dumpster: dumpster,
      ));
    }
    return rentalReport;
  }

  Future<List<RentalReport>> getDailyRetrievalReport(
    String date,
  ) async {
    final list = await _firestoreService.getDataByFilters(
      collection,
      [
        Filtro(
          key: 'retrievalDate',
          operator: Operator.isEqualTo,
          value: date,
        ),
      ],
    );
    List<RentalReport> dailyRentalReport = [];
    for (var e in list) {
      final client = Client.fromJson(
          (await _firestoreService.getDataById('clients', e['client'])));
      final dumpster = Dumpster.fromJson(
          (await _firestoreService.getDataById('dumpsters', e['dumpster'])));
      dailyRentalReport.add(RentalReport(
        rental: Rental.fromJson(e),
        client: client,
        dumpster: dumpster,
      ));
    }
    return dailyRentalReport;
  }

  Future<List<RentalReport>> getRetrievalReport(
    String initialDate,
    String finalDate,
  ) async {
    final list = await _firestoreService.getDataByFilters(
      collection,
      [
        Filtro(
          key: 'retrievalDate',
          operator: Operator.isGreaterThanOrEqualTo,
          value: initialDate,
        ),
        Filtro(
          key: 'retrievalDate',
          operator: Operator.isLessThanOrEqualTo,
          value: finalDate,
        ),
      ],
    );
    List<RentalReport> rentalReport = [];
    for (var e in list) {
      final client = Client.fromJson(
          (await _firestoreService.getDataById('clients', e['client'])));
      final dumpster = Dumpster.fromJson(
          (await _firestoreService.getDataById('dumpsters', e['dumpster'])));
      rentalReport.add(RentalReport(
        rental: Rental.fromJson(e),
        client: client,
        dumpster: dumpster,
      ));
    }
    return rentalReport;
  }

  Future<List<RentalReport>> getDumpsterUtilizationReport(
    String initialDate,
    String finalDate, {
    String? dumpsterId,
    int? size,
  }) async {
    var list = <Map<String, dynamic>>[];
    if (dumpsterId != null) {
      list = await _firestoreService.getDataByFilters(
        collection,
        [
          Filtro(
            key: 'dumpster',
            operator: Operator.isEqualTo,
            value: dumpsterId,
          ),
          Filtro(
            key: 'rentalDate',
            operator: Operator.isGreaterThanOrEqualTo,
            value: initialDate,
          ),
          Filtro(
            key: 'rentalDate',
            operator: Operator.isLessThanOrEqualTo,
            value: finalDate,
          ),
        ],
      );
    } else {
      list = await _firestoreService.getDataByFilters(
        collection,
        [
          Filtro(
            key: 'rentalDate',
            operator: Operator.isGreaterThanOrEqualTo,
            value: initialDate,
          ),
          Filtro(
            key: 'rentalDate',
            operator: Operator.isLessThanOrEqualTo,
            value: finalDate,
          ),
        ],
      );
    }
    List<RentalReport> rentalReport = [];
    for (var e in list) {
      final client = Client.fromJson(
          (await _firestoreService.getDataById('clients', e['client'])));
      final dumpster = Dumpster.fromJson(
          (await _firestoreService.getDataById('dumpsters', e['dumpster'])));
      if (size != null) {
        if (dumpster.size == size) {
          rentalReport.add(RentalReport(
            rental: Rental.fromJson(e),
            client: client,
            dumpster: dumpster,
          ));
        }
      } else {
        rentalReport.add(RentalReport(
          rental: Rental.fromJson(e),
          client: client,
          dumpster: dumpster,
        ));
      }
    }
    if (rentalReport.isNotEmpty) {
      rentalReport.sort((a, b) => a.dumpster.code!.compareTo(b.dumpster.code!));
    }
    return rentalReport;
  }
}
