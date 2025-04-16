import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multichat/data/services/storage-service.dart';

import '../../locator.dart';
import '../core/network/network_service.dart';
import 'app_cache.dart';

class UserServices {
  StorageService storageService = getIt<StorageService>();
  AppCache cache = getIt<AppCache>();
  final box = GetStorage();
  final _networkService = NetworkController.instance;
  late Dio _dio;
  String? baseUrl;

  logout() async {
    box.erase();
    storageService.deleteAllItems();
    cache.clearCache();
    //navigationService.navigateToReplaceWidget(const SignIn());
    snackBars("Log Out Successfully", true);
  }

  // storeUser(WalletResponse? walletResponse) async {
  //   print("Storing User");
  //   if (walletResponse != null) {
  //     await storageService.storeItem(
  //       key: Boxes.walletDetails,
  //       value: jsonEncode(walletResponse),
  //     );
  //   }
  //   await getUser();
  // }
  //
  // Future<UserResponse?> getUser() async {
  //   final data = await storageService.readItem(key: DbTable.USER_TABLE_NAME);
  //   if (data == null || data == "null") {
  //     return null;
  //   } else {
  //     UserResponse userResponse = UserResponse.fromJson(jsonDecode(data));
  //     return userResponse;
  //   }
  // }
  //
  // secureAth(SecureResponse? secureResponse) async {
  //   print("Storing secureAuth");
  //   if (secureResponse != null) {
  //     await storageService.storeItem(
  //       key: DbTable.USER_SECURE_AUTH,
  //       value: jsonEncode(secureResponse),
  //     );
  //   }
  //   await getSecureAuth();
  // }
  //
  // Future<SecureResponse?> getSecureAuth() async {
  //   final data = await storageService.readItem(key: DbTable.USER_SECURE_AUTH);
  //   if (data == null || data == "null") {
  //     return null;
  //   } else {
  //     SecureResponse reelsResponse = SecureResponse.fromJson(jsonDecode(data));
  //     return reelsResponse;
  //   }
  // }
}
