import 'package:flutter/cupertino.dart';

import '../../locator.dart';
import '../../services/navigation_service.dart';

class BaseViewModel extends ChangeNotifier {
  String? errorMessage;
  NavigationService navigationService = getIt<NavigationService>();

  void setError(String? error) {
    errorMessage = error;
    notifyListeners();
  }

  bool isLoading = false;
}
