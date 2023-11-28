import 'package:loccon/core/models/dumpster.dart';
import 'package:mobx/mobx.dart';

class DumpsterStore with Store {
  @readonly
  Dumpster? _dumpster;

  Dumpster? get dumpster => _dumpster;

  @action
  void setDumpster(Dumpster dumpster) {
    _dumpster = dumpster;
  }

  @action
  void clear() {
    _dumpster = null;
  }
}
