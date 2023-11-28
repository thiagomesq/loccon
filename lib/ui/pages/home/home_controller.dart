import 'package:loccon/core/models/lc_user.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:loccon/ui/stores/user_store.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase extends ControllerBase with Store {
  final UserStore _userStore;

  HomeControllerBase(this._userStore);

  @computed
  LCUser get user => _userStore.user!;
}
