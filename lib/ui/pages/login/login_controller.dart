import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loccon/core/models/lc_user.dart';
import 'package:loccon/infra/http/services/auth_service.dart';
import 'package:loccon/infra/http/services/prices_service.dart';
import 'package:loccon/infra/http/services/user_service.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:loccon/ui/stores/prices_store.dart';
import 'package:loccon/ui/stores/user_store.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase extends ControllerBase with Store {
  final AuthService _authService;
  final UserService _userService;
  final PricesService _pricesService;
  final UserStore _userStore;
  final PricesStore _pricesStore;
  final void Function(BuildContext context, LCUser? user) _onValidatedCode;

  _LoginControllerBase(
    this._authService,
    this._userService,
    this._pricesService,
    this._userStore,
    this._pricesStore,
    this._onValidatedCode,
  );

  @observable
  String? phone;

  @observable
  String? smsCode;

  @observable
  String? receivedCode;

  @observable
  bool isCodeSent = false;

  @computed
  bool get isFormValid => phone != null && phone!.length == 14;

  @computed
  bool get isSmsCodeValid => smsCode != null && smsCode!.length == 6;

  @action
  void codeSent(String verificationId, int? resendToken) {
    receivedCode = verificationId;
  }

  @action
  Future<void> validateCode(BuildContext context) async {
    await _authService.auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: receivedCode!,
        smsCode: smsCode!,
      ),
    );
    final user = await _authService.getUser();
    LCUser lcUser = await _userService.getUser(user!.uid);
    if (lcUser.id != null) {
      _userStore.setUser(lcUser);
    } else {
      _userStore.setIsNewUser(true);
    }
    final prices = await _pricesService.getPrices();
    _pricesStore.setPrices(prices!);
    _onValidatedCode(context, lcUser);
  }

  @action
  Future<void> sendCode() async {
    await _authService.sendCode(
      phone!,
      codeSent,
      (e) {
        print(e);
      },
    );
    phone = '';
    isCodeSent = true;
  }
}
