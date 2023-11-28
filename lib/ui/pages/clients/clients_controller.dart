import 'package:loccon/core/models/client.dart';
import 'package:loccon/infra/http/services/clients_service.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:loccon/ui/stores/client_store.dart';
import 'package:mobx/mobx.dart';

part 'clients_controller.g.dart';

class ClientsController = ClientsControllerBase with _$ClientsController;

abstract class ClientsControllerBase extends ControllerBase with Store {
  final ClientsService _clientsService;
  final ClientStore clientStore;

  ClientsControllerBase(this._clientsService, this.clientStore) {
    fetch();
  }

  @observable
  ObservableFuture<ObservableList<Client>?> clientsLoading =
      ObservableFuture.value(null);

  @observable
  ObservableList<Client>? clients;

  @action
  Future<void> fetch() async {
    clientsLoading = _clientsService.getClients().asObservable();
    clients = await clientsLoading;
  }

  @action
  Future<void> delete(String id) async {
    await _clientsService.deleteClient(id);
    clients!.removeWhere((element) => element.id == id);
  }
}
