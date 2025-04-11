import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../utils/snack_message.dart';

// This handles the errors in the app i made use of DioError
void handleError(dynamic error) {
  var errorString = error.response.toString();
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.cancel:
      // showCustomToast("Request to API server was cancelled");
        break;
      case DioErrorType.connectionTimeout:
      // showCustomToast("Connection timeout with API server");
        break;
      case DioErrorType.unknown:
        snackBars("No internet Connection",false);
        break;
      case DioErrorType.receiveTimeout:
      // showCustomToast("Receive timeout in connection with API server");
        break;
      case DioErrorType.badResponse:
        final errorMessage =  error.response?.data["message"];
        if(errorMessage!=null) {
          print("TTT${errorMessage}");
          if(errorMessage=="invalid token"){
            // navigationService.navigateToReplaceWidget(const SignIn());
            snackBars("$errorMessage please try login again",false);

          }else{
            snackBars(errorMessage,false);
          }
          // invalid token
        }else{
          snackBars(error.response?.data["errors"],false);
        }
        break;
      case DioErrorType.sendTimeout:
        snackBars("Send timeout in connection with API server",false);
        break;
      default:
        snackBars("Something wenthhhh wrong",false);
        break;
    }
  } else {
    var json = jsonDecode(errorString);
    var nameJson = json['data'];
    snackBars(nameJson,false);
    throw nameJson;
  }
}