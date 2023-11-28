import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/infra/http/services/dumpster_service.dart';
import 'package:loccon/ui/stores/dumpster_store.dart';
import 'package:mobx/mobx.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';

part 'dumpsters_controller.g.dart';

class DumpstersController = DumpstersControllerBase with _$DumpstersController;

abstract class DumpstersControllerBase extends ControllerBase with Store {
  final DumpsterService _dumpsterService;
  final DumpsterStore dumpsterStore;

  DumpstersControllerBase(this._dumpsterService, this.dumpsterStore) {
    fetch();
  }

  @observable
  ObservableFuture<ObservableList<Dumpster>?> dumpstersLoading =
      ObservableFuture.value(null);

  @observable
  ObservableList<Dumpster>? dumpsters;

  @action
  Future<void> fetch() async {
    dumpstersLoading = _dumpsterService.getDumpsters().asObservable();
    dumpsters = await dumpstersLoading;
  }

  @action
  Future<void> delete(String id) async {
    await _dumpsterService.deleteDumpster(id);
    dumpsters!.removeWhere((element) => element.id == id);
  }
}
