import 'package:loccon/core/models/client.dart';
import 'package:mobx/mobx.dart';

class ClientStore with Store {
  @readonly
  Client? _client;

  Client? get client => _client;

  @action
  void setClient(Client client) {
    _client = client;
  }

  @action
  void clear() {
    _client = null;
  }
}
