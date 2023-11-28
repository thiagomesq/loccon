import 'package:loccon/core/enums/client_type.dart';
import 'package:loccon/core/models/client.dart';
import 'package:loccon/infra/http/services/clients_service.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:loccon/ui/stores/client_store.dart';
import 'package:mobx/mobx.dart';

part 'add_edit_controller.g.dart';

class AddEditClientsController = AddEditClientsControllerBase
    with _$AddEditClientsController;

abstract class AddEditClientsControllerBase extends ControllerBase with Store {
  final ClientStore _clientStore;
  final ClientsService _clientsService;

  AddEditClientsControllerBase(this._clientStore, this._clientsService) {
    fetch();
  }

  @observable
  Client? client;

  @observable
  ClientType? type;

  @observable
  String? company;

  @observable
  String? name;

  @observable
  String? usdot;

  @observable
  String? ssn;

  @observable
  String? phone;

  @observable
  String? contact;

  @computed
  bool get isFormValid {
    if (type == ClientType.company) {
      return company != null &&
          company!.isNotEmpty &&
          usdot != null &&
          usdot!.isNotEmpty &&
          phone != null &&
          phone!.isNotEmpty;
    } else {
      return name != null &&
          name!.isNotEmpty &&
          ssn != null &&
          ssn!.isNotEmpty &&
          phone != null &&
          phone!.isNotEmpty;
    }
  }

  @action
  void fetch() {
    client = _clientStore.client;
    if (client != null) {
      if (client!.company != null) {
        company = client!.company;
        usdot = client!.usdot;
        type = ClientType.company;
      } else {
        type = ClientType.person;
        name = client!.name;
        ssn = client!.ssn;
      }
      phone = client!.phone;
      contact = client!.contact;
    }
  }

  @action
  Future<void> save() async {
    if (client == null) {
      if (type == ClientType.company) {
        client = Client(
          company: company,
          usdot: usdot,
          phone: phone,
          contact: contact,
        );
      } else {
        client = Client(
          name: name,
          ssn: ssn,
          phone: phone,
          contact: contact,
        );
      }
    }
    await _clientsService.saveClient(client!);
  }
}
