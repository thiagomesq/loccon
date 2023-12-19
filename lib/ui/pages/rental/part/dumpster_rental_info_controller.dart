import 'package:intl/intl.dart';
import 'package:dumpin/core/models/dumpster.dart';
import 'package:dumpin/core/models/prices.dart';
import 'package:dumpin/core/models/rental.dart';
import 'package:dumpin/infra/http/services/clients_service.dart';
import 'package:dumpin/infra/http/services/dumpster_service.dart';
import 'package:dumpin/infra/http/services/rental_service.dart';
import 'package:dumpin/ui/shared/controller_base/controller_base.dart';
import 'package:dumpin/ui/stores/prices_store.dart';
import 'package:dumpin/ui/stores/rental_store.dart';
import 'package:mobx/mobx.dart';

part 'dumpster_rental_info_controller.g.dart';

class DumpsterRentalInfoController = DumpsterRentalInfoControllerBase
    with _$DumpsterRentalInfoController;

abstract class DumpsterRentalInfoControllerBase extends ControllerBase
    with Store {
  final RentalService _rentalService;
  final DumpsterService _dumpsterService;
  final ClientsService _clientsService;
  final RentalStore rentalStore;
  final PricesStore pricesStore;

  DumpsterRentalInfoControllerBase(
    this._rentalService,
    this._dumpsterService,
    this._clientsService,
    this.rentalStore,
    this.pricesStore,
  ) {
    fetch();
  }

  @observable
  ObservableFuture<Dumpster?> dumpsterLoading = ObservableFuture.value(null);

  @observable
  Dumpster dumpster = Dumpster();

  @observable
  Rental? rental;

  @observable
  bool isBeforeRentalDate = false;

  @computed
  Prices get prices => pricesStore.prices!;

  @action
  Future<void> fetch() async {
    String id = rentalStore.dumpster!.id!;
    dumpsterLoading = _dumpsterService.getDumpster(id).asObservable();
    dumpster = (await dumpsterLoading)!;
    if (dumpster.isRented) {
      rental = await _rentalService.getRentalByDumpsterId(id);
      final today = DateTime.now();
      final rentalDate = DateFormat('MM-dd-yyyy').parse(rental!.rentalDate!);
      isBeforeRentalDate = today.isBefore(rentalDate);
    }
  }

  Future<List<Rental>> rentalHistory() async {
    List<Rental> list =
        await _rentalService.getRentalsByDumpsterId(dumpster.id!);
    if (list.isNotEmpty) {
      for (var i = 0; i < list.length; i++) {
        final client = await _clientsService.getClient(list[i].client!);
        list[i].client = client.name;
      }
    }
    return list;
  }

  @action
  Future<void> retrieveOrCancel() async {
    if (!isBeforeRentalDate) {
      await _retrieve();
    } else {
      await _cancel();
    }
    dumpster.isRented = false;
    await _dumpsterService.saveDumpster(dumpster);
  }

  Future<void> _retrieve() async {
    rental!.pickUpDate = DateFormat('MM-dd-yyyy').format(DateTime.now());
    final rentalDate = DateFormat('MM-dd-yyyy').parse(rental!.rentalDate!);
    final retrievalDate = DateFormat('MM-dd-yyyy').parse(rental!.pickUpDate!);
    final difference = retrievalDate.difference(rentalDate).inDays;
    if (difference <= 7) {
      rental!.price = prices.weeklyPrice;
    } else {
      final price = prices.weeklyPrice! +
          (prices.additionalPricePerDay! * (difference - 7));
      rental!.price = price;
    }

    await _rentalService.saveRental(rental!);
  }

  Future<void> _cancel() async {
    await _rentalService.deleteRental(rental!.id!);
  }
}
