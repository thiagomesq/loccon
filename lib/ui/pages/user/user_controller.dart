import 'package:dumpin/core/enums/user_type.dart';
import 'package:dumpin/core/models/lc_user.dart';
import 'package:dumpin/infra/http/services/auth_service.dart';
import 'package:dumpin/infra/http/services/user_service.dart';
import 'package:dumpin/ui/shared/controller_base/controller_base.dart';
import 'package:dumpin/ui/stores/user_store.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase extends ControllerBase with Store {
  final AuthService _authService;
  final UserStore _userStore;
  final UserService _userService;

  UserControllerBase(
    this._authService,
    this._userStore,
    this._userService,
  ) {
    fetch();
  }

  @observable
  ObservableFuture<LCUser?> userLoading = ObservableFuture.value(null);

  @observable
  LCUser? user;

  @observable
  String? username;

  @observable
  UserType? type;

  @computed
  bool get isNewUser => _userStore.isNewUser;

  @computed
  bool get isFormValid => username != null && type != null;

  @action
  Future<void> fetch() async {
    if (!isNewUser) {
      final u = _userStore.user;
      userLoading = _userService.getUser(u!.id!).asObservable();
      user = await userLoading;
      username = user!.username;
      type = user!.type;
    } else {
      user = LCUser();
    }
  }

  @action
  Future<void> save() async {
    if (user!.id == null) {
      final u = await _authService.getUser();
      user!.id = u!.uid;
    }
    user!.type = type;
    user!.username = username;
    await _authService.updateProfile(username!);
    final result = await _userService.saveUser(user!);
    switch (result) {
      case 'Success':
        _userStore.setUser(user!);
        break;
      default:
        throw Exception(result);
    }
  }
}
