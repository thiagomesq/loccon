import 'package:dumpin/infra/http/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dumpin/infra/http/services/clients_service.dart';
import 'package:dumpin/infra/http/services/dumpster_service.dart';
import 'package:dumpin/infra/http/services/excel_service.dart';
import 'package:dumpin/infra/http/services/firebase_service.dart';
import 'package:dumpin/infra/http/services/firestore_service.dart';
import 'package:dumpin/infra/http/services/pdf_service.dart';
import 'package:dumpin/infra/http/services/prices_service.dart';
import 'package:dumpin/infra/http/services/rental_service.dart';
import 'package:dumpin/infra/http/services/user_service.dart';
import 'package:dumpin/ui/stores/client_store.dart';
import 'package:dumpin/ui/stores/dumpster_store.dart';
import 'package:dumpin/ui/stores/prices_store.dart';
import 'package:dumpin/ui/stores/rental_store.dart';
import 'package:dumpin/ui/stores/user_store.dart';

final i = GetIt.I;

Future<void> configureDI() async {
  i.registerSingletonAsync<FirebaseService>(() => FirebaseService.init());

  i.registerLazySingleton(() => FirestoreService());
  //i.registerSingletonAsync<Env>(() => Env.init());
  i.registerLazySingleton(() => AuthService());
  i.registerLazySingleton(() => PDFService());
  i.registerLazySingleton(() => ExcelService());

  i.registerLazySingleton<UserStore>(() => UserStore());
  i.registerLazySingleton<ClientStore>(() => ClientStore());
  i.registerLazySingleton<DumpsterStore>(() => DumpsterStore());
  i.registerLazySingleton<RentalStore>(() => RentalStore());
  i.registerLazySingleton<PricesStore>(() => PricesStore());

  /*i.registerFactory(() => AuthInterceptor(i.get()));
  i.registerLazySingleton<QRCodeService>(() => QRCodeService());
  i.registerLazySingleton(() => PreferenceService(i.get()));
  i.registerLazySingleton(() => NotificationHubService(i(), i()));
  i.registerLazySingleton(() => LoginService(i(), i(), i(), i()));

  i.registerLazySingleton<OnboardingStore>(() => OnboardingStore(i()));
  i.registerLazySingleton<HomeStore>(() => HomeStore(i(), i()));
  i.registerLazySingleton<VacinasStore>(() => VacinasStore());

  i.registerFactory<RPImagePicker>(() => RPImagePicker(i.get()));*/

  configureHttpServices();

  return await i.allReady();
}

void configureHttpServices() {
  i.registerLazySingleton(() => UserService(i()));
  i.registerLazySingleton(() => ClientsService(i()));
  i.registerLazySingleton(() => DumpsterService(i()));
  i.registerLazySingleton(() => RentalService(i()));
  i.registerLazySingleton(() => PricesService(i()));
}
