
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../../auth/sign_in/sign_in.dart';
import '../../base/base.vm.dart';
import '../onboarding/onboarding_view.dart';

class SplashViewModel extends BaseViewModel {
  late  int currentPageIndex = 0;
  final pageController = PageController(initialPage: 0);

  bool getStarted =false;
  // Delay Splash Screen for 4 sec
splash() async {
    final box = GetStorage();
    String? userToken = box.read('token');
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    navigationService.navigateToReplaceWidget(const OnboardingView());
    // if(userToken==null){
    //   navigationService.navigateToReplaceWidget(const OnboardingView());
    // }else{
    //   //navigationService.navigateToReplaceWidget(const BottomNav(selectedIndex: 0));
    //   // navigationService.navigateToReplace(AppRoutes.driver);
    //   //
    // }
  }


}
