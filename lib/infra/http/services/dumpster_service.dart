import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/infra/http/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

class DumpsterService {
  final FirestoreService _firestoreService;
  final collection = 'dumpsters';

  DumpsterService(this._firestoreService);

  Future<ObservableList<Dumpster>> getDumpsters() async {
    final list =
        await _firestoreService.getData(collection, orderBy: ['size', 'code']);
    return list.map((doc) => Dumpster.fromJson(doc)).toList().asObservable();
  }

  Future<Dumpster> getDumpster(String id) async {
    final doc = await _firestoreService.getDataById(collection, id);
    return Dumpster.fromJson(doc);
  }

  Future<String> saveDumpster(Dumpster dumpster) async {
    return await _firestoreService.saveData(
      collection,
      dumpster.toJson(),
      dumpster.id!,
    );
  }

  Future<String> deleteDumpster(String id) async {
    return await _firestoreService.deleteData(collection, id);
  }
}
