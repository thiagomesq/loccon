import 'package:loccon/core/models/lc_user.dart';
import 'package:loccon/infra/http/services/firestore_service.dart';

class UserService {
  final FirestoreService _firestoreService;
  final collection = 'users';

  UserService(this._firestoreService);

  Future<LCUser> getUser(String id) async {
    final doc = await _firestoreService.getDataById(collection, id);
    return LCUser.fromJson(doc);
  }

  Future<List<LCUser>> getUsers() async {
    final list = await _firestoreService.getData(collection);
    return list.map((doc) => LCUser.fromJson(doc)).toList();
  }

  Future<String> saveUser(LCUser user) async {
    return await _firestoreService.saveData(
      collection,
      user.toJson(),
      user.id!,
    );
  }

  Future<String> deleteUser(String id) async {
    return await _firestoreService.deleteData(collection, id);
  }
}
