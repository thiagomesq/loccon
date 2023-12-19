import 'package:intl/intl.dart';
import 'package:dumpin/core/enums/operator.dart';
import 'package:dumpin/core/models/client.dart';
import 'package:dumpin/core/models/filtro.dart';
import 'package:dumpin/infra/http/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

class ClientsService {
  final FirestoreService _firestoreService;
  final collection = 'clients';

  ClientsService(this._firestoreService);

  Future<ObservableList<Client>> getClients(
      {String? initialDate, String? finalDate}) async {
    var list = <Map<String, dynamic>>[];
    if (initialDate != null && finalDate != null) {
      list = await _firestoreService.getDataByFilters(
        collection,
        [
          Filtro(
            key: 'createdAt',
            operator: Operator.isGreaterThanOrEqualTo,
            value:
                DateFormat('MM-dd-yyyy').parse(initialDate).toIso8601String(),
          ),
          Filtro(
            key: 'createdAt',
            operator: Operator.isLessThanOrEqualTo,
            value: DateFormat('MM-dd-yyyy')
                .parse(finalDate)
                .add(const Duration(days: 1))
                .toIso8601String(),
          ),
        ],
      );
    } else {
      list = await _firestoreService.getData(collection);
    }
    return list.map((doc) => Client.fromJson(doc)).toList().asObservable();
  }

  Future<Client> getClient(String id) async {
    final doc = await _firestoreService.getDataById(collection, id);
    return Client.fromJson(doc);
  }

  Future<String> saveClient(Client client) async {
    return await _firestoreService.saveData(
      collection,
      client.toJson(),
      client.id!,
    );
  }

  Future<String> deleteClient(String id) async {
    return await _firestoreService.deleteData(collection, id);
  }
}
