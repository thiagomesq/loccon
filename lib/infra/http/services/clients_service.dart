import 'package:loccon/core/models/client.dart';
import 'package:loccon/infra/http/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

class ClientsService {
  final FirestoreService _firestoreService;
  final collection = 'clients';

  ClientsService(this._firestoreService);

  Future<ObservableList<Client>> getClients() async {
    final list = await _firestoreService.getData(collection);
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
