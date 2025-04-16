import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'data/services/app_cache.dart';
import 'data/services/navigation_service.dart';
import 'data/services/remote_service.dart';
import 'data/services/storage-service.dart';
import 'data/services/user_services.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  setupDio();

  //Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  getIt.registerLazySingleton<AppCache>(() => AppCache());
  getIt.registerLazySingleton<UserServices>(() => UserServices());
  getIt.registerLazySingleton<RemoteServices>(
    () => RemoteServices(getIt<Dio>(), getIt<UserServices>()),
  );
  registerViewModel();
}

void setupDio() {
  getIt.registerFactory(() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    // customization
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  });
}

void registerViewModel() {
  //View Model
  // getIt.registerFactory<BaseViewModel>(() => BaseViewModel());
  // getIt.registerFactory<SplashViewModel>(() => SplashViewModel());
  // getIt.registerFactory<SignUpViewModel>(() => SignUpViewModel());
  // getIt.registerFactory<SignInViewModel>(() => SignInViewModel());
  // //getIt.registerFactory<SecureAccountViewModel>(() => SecureAccountViewModel());
  // getIt.registerFactory<OnboardingViewModel>(() => OnboardingViewModel());
  // getIt.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());
  // getIt.registerFactory<ProfilesViewModel>(() => ProfilesViewModel());
  // getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
  // getIt.registerFactory<BottomNavViewModel>(() => BottomNavViewModel());
  // getIt.registerFactory<SendMoneyViewModel>(() => SendMoneyViewModel());
  // getIt.registerFactory<SendToUSViewModel>(() => SendToUSViewModel());
  // getIt.registerFactory<AccountsViewModel>(() =>AccountsViewModel());
  // getIt.registerFactory<AddMoneyViewModel>(() => AddMoneyViewModel());
  // getIt.registerFactory<SendToCryptoViewModel>(() =>SendToCryptoViewModel());
}
