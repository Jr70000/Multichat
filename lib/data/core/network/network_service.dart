import 'dart:async';
import 'dart:developer' as AppUtility;
import 'dart:io';

import 'package:bucx/utils/snack_message.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController {
  NetworkController._internal();

  var isConnected = false;
  var isInitialized = false;

  static final NetworkController _instance = NetworkController._internal();

  final StreamController<bool> _connectionStatusController =
  StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _streamSubscription;

  static NetworkController get instance => _instance;

  Stream<bool> get connectionStatus =>
      _connectionStatusController.stream.asBroadcastStream();

  void close() {
    _streamSubscription?.cancel();
    _connectionStatusController.close();
    isInitialized = false;
  }

  Future<void> init() async {
    AppUtility.log('NetworkController Initializing');

    if (isInitialized) {
      AppUtility.log('NetworkController Already Initialized');
      return;
    }

    await _checkForInternetConnectivity(); // ✅ Call function

    // ✅ FIXED: Extract first ConnectivityResult from list
    _streamSubscription = _connectivity.onConnectivityChanged.listen((results) {
      if (results.isNotEmpty) {
        _updateConnectionStatus(results.first);
      }
    });

    isInitialized = true;
    AppUtility.log('NetworkController Initialized');
  }

  /// ✅ Function to Check for Active Internet Connection
  Future<void> _checkForInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup(
          'google.com'); // ✅ Check actual internet access
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
        _connectionStatusController.add(true);
        AppUtility.log('Internet Connection Available');
      } else {
        _setNoConnection();
      }
    } on SocketException {
      _setNoConnection();
    }
  }

  /// ✅ Update Connection Status
  void _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      await _checkForInternetConnectivity(); // ✅ Double check actual internet access
    } else {
      _setNoConnection();
    }
  }

  /// ✅ Handle No Internet Connection
  void _setNoConnection() {
    isConnected = false;
    _connectionStatusController.add(false);
    AppUtility.log('No Internet Connection');
    snackBars('No internet connection', false);
  }
}
