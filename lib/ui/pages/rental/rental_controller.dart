import 'package:loccon/core/models/dumpster.dart';
import 'package:loccon/infra/http/services/dumpster_service.dart';
import 'package:loccon/ui/shared/controller_base/controller_base.dart';
import 'package:loccon/ui/stores/rental_store.dart';
import 'package:mobx/mobx.dart';

part 'rental_controller.g.dart';

class RentalController = RentalControllerBase with _$RentalController;

abstract class RentalControllerBase extends ControllerBase with Store {
  final DumpsterService _dumpsterService;
  final RentalStore rentalStore;

  RentalControllerBase(this._dumpsterService, this.rentalStore) {
    fetch();
  }

  @observable
  ObservableFuture<ObservableList<Dumpster>?> dumpstersLoading =
      ObservableFuture.value(null);

  @observable
  ObservableList<Dumpster>? dumpsters;

  @observable
  List<String>? sizeHeaders;

  @action
  Future<void> fetch() async {
    dumpstersLoading = _dumpsterService.getDumpsters().asObservable();
    dumpsters = await dumpstersLoading;
    if (dumpsters != null && dumpsters!.isNotEmpty) {
      sizeHeaders =
          dumpsters!.map((dumpster) => '${dumpster.size}Y').toSet().toList();
    }
  }
}
