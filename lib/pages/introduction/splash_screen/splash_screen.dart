import 'package:bucx/pages/introduction/splash_screen/splash.vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_images.dart';
import '../../../utils/pallet.dart';
import '../../../utils/widget_extensions.dart';
import '../../base/base_ui.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BaseView<SplashViewModel>(
        onModelReady: (model) {
          model.splash();
    },
    builder: (context, model,child) => Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
        height: height(context),
        width: width(context),
        child: Center(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: 100.w,
                    height: 100.h,
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
