// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddEditDumpstersController on AddEditDumpstersControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'AddEditDumpstersControllerBase.isFormValid'))
          .value;

  late final _$dumpsterAtom =
      Atom(name: 'AddEditDumpstersControllerBase.dumpster', context: context);

  @override
  Dumpster? get dumpster {
    _$dumpsterAtom.reportRead();
    return super.dumpster;
  }

  @override
  set dumpster(Dumpster? value) {
    _$dumpsterAtom.reportWrite(value, super.dumpster, () {
      super.dumpster = value;
    });
  }

  late final _$codeAtom =
      Atom(name: 'AddEditDumpstersControllerBase.code', context: context);

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$sizeAtom =
      Atom(name: 'AddEditDumpstersControllerBase.size', context: context);

  @override
  int? get size {
    _$sizeAtom.reportRead();
    return super.size;
  }

  @override
  set size(int? value) {
    _$sizeAtom.reportWrite(value, super.size, () {
      super.size = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('AddEditDumpstersControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$AddEditDumpstersControllerBaseActionController =
      ActionController(
          name: 'AddEditDumpstersControllerBase', context: context);

  @override
  void fetch() {
    final _$actionInfo = _$AddEditDumpstersControllerBaseActionController
        .startAction(name: 'AddEditDumpstersControllerBase.fetch');
    try {
      return super.fetch();
    } finally {
      _$AddEditDumpstersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dumpster: ${dumpster},
code: ${code},
size: ${size},
isFormValid: ${isFormValid}
    ''';
  }
}
