import 'package:loccon/core/models/lc_user.dart';
import 'package:mobx/mobx.dart';

class UserStore with Store {
  @readonly
  LCUser? _user;

  @readonly
  bool isNewUser = false;

  LCUser? get user => _user;

  @action
  void setUser(LCUser user) {
    _user = user;
  }

  @action
  void clearUser() {
    _user = null;
  }

  @action
  void setIsNewUser(bool value) {
    isNewUser = value;
  }
}
