import 'package:dumpin/core/models/lc_user.dart';
import 'package:dumpin/infra/http/services/auth_service.dart';
import 'package:dumpin/infra/http/services/prices_service.dart';
import 'package:dumpin/infra/http/services/user_service.dart';
import 'package:dumpin/ui/shared/controller_base/controller_base.dart';
import 'package:dumpin/ui/stores/prices_store.dart';
import 'package:dumpin/ui/stores/user_store.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase extends ControllerBase with Store {
  final AuthService _authService;
  final UserService _userService;
  final PricesService _pricesService;
  final UserStore _userStore;
  final PricesStore _pricesStore;
  final void Function(bool isLogged, LCUser? user) onAuthenticated;

  SplashControllerBase(
    this._authService,
    this._userService,
    this._pricesService,
    this._userStore,
    this._pricesStore,
    this.onAuthenticated,
  ) {
    init();
  }

  void init() async {
    final u = await _authService.getUser();
    LCUser? user;
    bool isNotNullUser = u != null;
    if (isNotNullUser) {
      user = await _userService.getUser(u.uid);
      if (user.id == null) {
        _userStore.setIsNewUser(true);
      } else {
        _userStore.setUser(user);
      }
      final prices = await _pricesService.getPrices();
      _pricesStore.setPrices(prices!);
    }
    onAuthenticated(isNotNullUser, user);
  }
}
