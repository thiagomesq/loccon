import 'package:loccon/core/models/prices.dart';
import 'package:loccon/infra/http/services/firestore_service.dart';

class PricesService {
  final FirestoreService _firestoreService;
  final collection = 'prices';

  PricesService(this._firestoreService);

  Future<Prices?> getPrices() async {
    final doc = await _firestoreService.getData(collection);
    return Prices.fromJson(doc.first);
  }

  Future<void> savePrices(Prices prices) async {
    await _firestoreService.saveData(
      collection,
      prices.toJson(),
      prices.id!,
    );
  }
}
