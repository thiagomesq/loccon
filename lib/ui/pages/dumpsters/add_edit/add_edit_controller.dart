import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/infra/http/services/dumpster_service.dart';
import 'package:loccon/ui/stores/dumpster_store.dart';
import 'package:mobx/mobx.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';

part 'add_edit_controller.g.dart';

class AddEditDumpstersController = AddEditDumpstersControllerBase
    with _$AddEditDumpstersController;

abstract class AddEditDumpstersControllerBase extends ControllerBase
    with Store {
  final DumpsterStore _dumpsterStore;
  final DumpsterService _dumpsterService;

  AddEditDumpstersControllerBase(this._dumpsterStore, this._dumpsterService) {
    fetch();
  }

  @observable
  Dumpster? dumpster;

  @observable
  String? code;

  @observable
  int? size;

  @computed
  bool get isFormValid {
    return code != null && code!.isNotEmpty && size != null && size! > 0;
  }

  @action
  void fetch() {
    dumpster = _dumpsterStore.dumpster;
    if (dumpster != null) {
      code = dumpster!.code;
      size = dumpster!.size;
    }
  }

  @action
  Future<void> save() async {
    if (dumpster == null) {
      dumpster = Dumpster(
        code: code!,
        size: size!,
      );
    } else {
      dumpster!.code = code!;
      dumpster!.size = size!;
    }
    await _dumpsterService.saveDumpster(dumpster!);
  }
}
