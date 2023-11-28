// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dumpsters_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DumpstersController on DumpstersControllerBase, Store {
  late final _$dumpstersLoadingAtom =
      Atom(name: 'DumpstersControllerBase.dumpstersLoading', context: context);

  @override
  ObservableFuture<ObservableList<Dumpster>?> get dumpstersLoading {
    _$dumpstersLoadingAtom.reportRead();
    return super.dumpstersLoading;
  }

  @override
  set dumpstersLoading(ObservableFuture<ObservableList<Dumpster>?> value) {
    _$dumpstersLoadingAtom.reportWrite(value, super.dumpstersLoading, () {
      super.dumpstersLoading = value;
    });
  }

  late final _$dumpstersAtom =
      Atom(name: 'DumpstersControllerBase.dumpsters', context: context);

  @override
  ObservableList<Dumpster>? get dumpsters {
    _$dumpstersAtom.reportRead();
    return super.dumpsters;
  }

  @override
  set dumpsters(ObservableList<Dumpster>? value) {
    _$dumpstersAtom.reportWrite(value, super.dumpsters, () {
      super.dumpsters = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('DumpstersControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$deleteAsyncAction =
      AsyncAction('DumpstersControllerBase.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
dumpstersLoading: ${dumpstersLoading},
dumpsters: ${dumpsters}
    ''';
  }
}
