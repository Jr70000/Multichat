import 'package:flutter/cupertino.dart';

import '../../data/services/navigation_service.dart';
import '../../locator.dart';

class BaseViewModel extends ChangeNotifier {
  String? errorMessage;
  NavigationService navigationService = getIt<NavigationService>();

  void setError(String? error) {
    errorMessage = error;
    notifyListeners();
  }

  bool isLoading = false;
}
