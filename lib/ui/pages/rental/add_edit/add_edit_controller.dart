import 'package:dumpin/core/models/client.dart';
import 'package:dumpin/core/models/dumpster.dart';
import 'package:dumpin/core/models/rental.dart';
import 'package:dumpin/infra/http/services/clients_service.dart';
import 'package:dumpin/infra/http/services/dumpster_service.dart';
import 'package:dumpin/infra/http/services/rental_service.dart';
import 'package:dumpin/ui/shared/controller_base/controller_base.dart';
import 'package:dumpin/ui/stores/rental_store.dart';
import 'package:mobx/mobx.dart';

part 'add_edit_controller.g.dart';

class AddEditRentalController = AddEditRentalControllerBase
    with _$AddEditRentalController;

abstract class AddEditRentalControllerBase extends ControllerBase with Store {
  final RentalService _rentalService;
  final ClientsService _clientsService;
  final DumpsterService _dumpsterService;
  final RentalStore rentalStore;

  AddEditRentalControllerBase(
    this._rentalService,
    this._clientsService,
    this._dumpsterService,
    this.rentalStore,
  ) {
    fetch();
  }

  @observable
  ObservableFuture<List<Client>> clientsLoading = ObservableFuture.value([]);

  @observable
  ObservableList<Client> clients = ObservableList<Client>();

  @observable
  Client? client;

  @observable
  String? rentalDate;

  @observable
  String? street;

  @observable
  String? number;

  @observable
  String? neighborhood;

  @observable
  String? city;

  @observable
  String? state;

  @observable
  String? zipCode;

  @computed
  Dumpster get dumpster => rentalStore.dumpster!;

  @computed
  Rental? get rental => rentalStore.rental;

  @computed
  bool get isFormValid {
    return client != null &&
        rentalDate != null &&
        rentalDate!.isNotEmpty &&
        street != null &&
        street!.isNotEmpty &&
        number != null &&
        number!.isNotEmpty &&
        neighborhood != null &&
        neighborhood!.isNotEmpty &&
        city != null &&
        city!.isNotEmpty &&
        state != null &&
        state!.isNotEmpty &&
        zipCode != null &&
        zipCode!.isNotEmpty;
  }

  @action
  Future<void> fetch() async {
    clientsLoading = ObservableFuture(_clientsService.getClients());
    clients = (await clientsLoading).asObservable();
    if (rental != null) {
      client = clients.firstWhere((client) => client.id == rental!.client!);
      rentalDate = rental!.rentalDate;
      street = rental!.street;
      number = rental!.number;
      neighborhood = rental!.neighborhood;
      city = rental!.city;
      state = rental!.state;
      zipCode = rental!.zipCode;
    }
  }

  @action
  Future<void> save() async {
    Rental r = Rental(
      client: client!.id,
      dumpster: dumpster.id,
      rentalDate: rentalDate!,
      street: street!,
      number: number!,
      neighborhood: neighborhood!,
      city: city!,
      state: state!,
      zipCode: zipCode!,
    );
    if (rental != null) {
      r.id = rental!.id;
    }
    await _rentalService.saveRental(r);
    dumpster.isRented = true;
    await _dumpsterService.saveDumpster(dumpster);
  }
}
