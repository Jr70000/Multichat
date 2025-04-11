import 'dart:convert';
import 'dart:math';

import 'package:bucx/data/core/storage/get_boxes.dart';
import 'package:bucx/data/services/user_services.dart';
import 'package:bucx/domain/model/auth_response.dart';
import 'package:bucx/utils/snack_message.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../../domain/model/login.dart';
import '../../domain/model/secure.dart';
import '../../domain/model/users.dart';
import '../../domain/model/verify.dart';
import '../../domain/model/wallet_response.dart';
import '../../locator.dart';
import '../core/config.dart';
import '../core/network/error_handler.dart';
import '../core/network/urlPath.dart';
import 'app_cache.dart';

/// This calls implements the UserRemote logic
class RemoteServices {
  final UserServices userServices;
  AppCache cache = getIt<AppCache>();
  final Dio dio;

  RemoteServices(
    this.dio,
    this.userServices,
  );



  @override
  Future<AuthResponse?> login(String email, String password) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'password': password,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.login}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = AuthResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStoragee
      final token = responseData.data;
      snackBars(token!, true);
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }


  @override
  Future<LoginResponse?> register(String email,) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'type':'emailVerification'
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.register}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = LoginResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      // final token = responseData.data?.token;
      // box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

@override
  Future<Response> verifyUnboardedEmail(String code, String email) async {
  final box = GetStorage();
  String? userToken = box.read('token');
    try {
      // the required parameters
      var dataBody = {
        'otp': code,
        'email': email
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.verifyUnboardedEmail}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            //'Authorization': "Bearer $userToken",
          }));
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

@override
Future<Response> verifyOTP (String email, String code) async{
    try{
      var dataBody = {
        'email': email,
        'otp' : code
  };
      var response = await dio.post("${Config.BASEURL}${UrlPath.verifyEmail}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
  }
  ));
      return response;
  }catch(err){
      handleError(err);
      rethrow;
  }
}

@override
  Future<VerifyResponse?> resendOTP(String email) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
      };
      var response = await dio.post("${Config.BASEURL}${UrlPath.resendOTP}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = VerifyResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      final token = responseData.data?.token;
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
//
@override
  Future<VerifyResponse?> requestPassword(String email) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.requestPassword}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = VerifyResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      final token = responseData.data?.token;
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<VerifyResponse?> resendPasswordOTP(String email) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.resendPasswordOTP}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = VerifyResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      final token = responseData.data?.token;
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
//
  @override
  Future<VerifyResponse?> resetPassword(code,String password,) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      // the required parameters
      var dataBody = {
        'otp':code,
        'password': password,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.resetPassword}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));
      final responseData = VerifyResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      final token = responseData.data?.token;
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<SecureResponse?> secureAuth() async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.secureAuth}",
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));
      final responseData = SecureResponse.fromJson(response.data);
      if(responseData.data!=null){
        userServices.secureAth(responseData);
      }
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<String?> verifySecureCode(String code) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      var dataBody = {
        'code': code,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.verifySecureCode}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));

      return response.data.toString();
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }


@override
  Future<String?> updateProfile(String fullname) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      var dataBody = {
        'fullname': fullname,
      };
      Dio _dio = Dio();
      var response = await dio.put("${Config.BASEURL}${UrlPath.user}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));

      return response.data.toString();
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

@override
  Future<String?> changePassword(String old_password,String password,) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      var dataBody = {
        'old_password': old_password,
        'password': password,
      };
      Dio _dio = Dio();
      var response = await dio.put("${Config.BASEURL}${UrlPath.changePassword}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));

      return response.data.toString();
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }


  @override
  Future<Wallet?> getUserWalletDetails(String token)async{
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);
    try {
      Dio _dio = Dio();
      var response = await dio.get("${Config.BASEURL}${UrlPath.getWallet}",
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            'authorization': "Bearer $userToken",
          }));
      print('the user is gotten successfully abd below is the data');
      print(response.data);
      await box.write(Boxes.walletDetails, jsonEncode(Wallet.fromJson(response.data)));
      final responseData = Wallet.fromJson(response.data);
      //print(responseData.message);
      print(responseData.solWallet.toJson());
      print('sored data is ... ... ... ... ...');
      //if(responseData != null){

       // userServices.storeUser(responseData);
     // }
       return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }


}
