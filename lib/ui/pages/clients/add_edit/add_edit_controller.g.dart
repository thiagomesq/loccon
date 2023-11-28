// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddEditClientsController on AddEditClientsControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'AddEditClientsControllerBase.isFormValid'))
          .value;

  late final _$clientAtom =
      Atom(name: 'AddEditClientsControllerBase.client', context: context);

  @override
  Client? get client {
    _$clientAtom.reportRead();
    return super.client;
  }

  @override
  set client(Client? value) {
    _$clientAtom.reportWrite(value, super.client, () {
      super.client = value;
    });
  }

  late final _$typeAtom =
      Atom(name: 'AddEditClientsControllerBase.type', context: context);

  @override
  ClientType? get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(ClientType? value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$companyAtom =
      Atom(name: 'AddEditClientsControllerBase.company', context: context);

  @override
  String? get company {
    _$companyAtom.reportRead();
    return super.company;
  }

  @override
  set company(String? value) {
    _$companyAtom.reportWrite(value, super.company, () {
      super.company = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'AddEditClientsControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$usdotAtom =
      Atom(name: 'AddEditClientsControllerBase.usdot', context: context);

  @override
  String? get usdot {
    _$usdotAtom.reportRead();
    return super.usdot;
  }

  @override
  set usdot(String? value) {
    _$usdotAtom.reportWrite(value, super.usdot, () {
      super.usdot = value;
    });
  }

  late final _$ssnAtom =
      Atom(name: 'AddEditClientsControllerBase.ssn', context: context);

  @override
  String? get ssn {
    _$ssnAtom.reportRead();
    return super.ssn;
  }

  @override
  set ssn(String? value) {
    _$ssnAtom.reportWrite(value, super.ssn, () {
      super.ssn = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: 'AddEditClientsControllerBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$contactAtom =
      Atom(name: 'AddEditClientsControllerBase.contact', context: context);

  @override
  String? get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(String? value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('AddEditClientsControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$AddEditClientsControllerBaseActionController =
      ActionController(name: 'AddEditClientsControllerBase', context: context);

  @override
  void fetch() {
    final _$actionInfo = _$AddEditClientsControllerBaseActionController
        .startAction(name: 'AddEditClientsControllerBase.fetch');
    try {
      return super.fetch();
    } finally {
      _$AddEditClientsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
client: ${client},
type: ${type},
company: ${company},
name: ${name},
usdot: ${usdot},
ssn: ${ssn},
phone: ${phone},
contact: ${contact},
isFormValid: ${isFormValid}
    ''';
  }
}
