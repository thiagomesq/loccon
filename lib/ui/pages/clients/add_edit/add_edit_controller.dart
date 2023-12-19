import 'package:dumpin/core/enums/client_type.dart';
import 'package:dumpin/core/models/client.dart';
import 'package:dumpin/infra/http/services/clients_service.dart';
import 'package:dumpin/ui/shared/controller_base/controller_base.dart';
import 'package:dumpin/ui/stores/client_store.dart';
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
  String? email;

  @observable
  String? phone;

  @observable
  String? contact;

  @computed
  bool get isFormValid {
    if (type == ClientType.company) {
      return company != null &&
          company!.isNotEmpty &&
          email != null &&
          email!.isNotEmpty &&
          phone != null &&
          phone!.isNotEmpty;
    } else {
      return name != null &&
          name!.isNotEmpty &&
          email != null &&
          email!.isNotEmpty &&
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
        type = ClientType.company;
      } else {
        type = ClientType.person;
        name = client!.name;
      }
      email = client!.email;
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
          email: email,
          phone: phone,
          contact: contact,
        );
      } else {
        client = Client(
          name: name,
          email: email,
          phone: phone,
          contact: contact,
        );
      }
    }
    await _clientsService.saveClient(client!);
  }
}
