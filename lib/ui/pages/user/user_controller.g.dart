// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on UserControllerBase, Store {
  Computed<bool>? _$isNewUserComputed;

  @override
  bool get isNewUser =>
      (_$isNewUserComputed ??= Computed<bool>(() => super.isNewUser,
              name: 'UserControllerBase.isNewUser'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'UserControllerBase.isFormValid'))
          .value;

  late final _$userLoadingAtom =
      Atom(name: 'UserControllerBase.userLoading', context: context);

  @override
  ObservableFuture<LCUser?> get userLoading {
    _$userLoadingAtom.reportRead();
    return super.userLoading;
  }

  @override
  set userLoading(ObservableFuture<LCUser?> value) {
    _$userLoadingAtom.reportWrite(value, super.userLoading, () {
      super.userLoading = value;
    });
  }

  late final _$userAtom =
      Atom(name: 'UserControllerBase.user', context: context);

  @override
  LCUser? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(LCUser? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: 'UserControllerBase.username', context: context);

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$typeAtom =
      Atom(name: 'UserControllerBase.type', context: context);

  @override
  UserType? get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(UserType? value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('UserControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$saveAsyncAction =
      AsyncAction('UserControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  @override
  String toString() {
    return '''
userLoading: ${userLoading},
user: ${user},
username: ${username},
type: ${type},
isNewUser: ${isNewUser},
isFormValid: ${isFormValid}
    ''';
  }
}
