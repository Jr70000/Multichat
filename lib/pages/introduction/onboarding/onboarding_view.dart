import 'package:bucx/pages/auth/sign_up/sign_up.vm.dart';
import 'package:bucx/pages/introduction/onboarding/onboarding_vm.dart';
import 'package:bucx/utils/app_buttons.dart';
import 'package:bucx/utils/app_images.dart';
import 'package:bucx/utils/app_strings.dart';
import 'package:bucx/utils/constants.dart';
import 'package:bucx/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/pallet.dart';
import '../../auth/sign_in/sign_in.dart';
import '../../auth/sign_up/let_us_know_you.dart';
import '../../auth/sign_up/sign_up.dart';
import '../../base/base_ui.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingViewModel>(
        notDefaultLoading: true,
        onModelReady: (model) {},
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppColor.white,
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.sp
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 20.h,
                    left: 0.sp,
                    right: 0.sp,

                    child: Padding(padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    CircleAvatar(radius: 150.sp,
                    backgroundColor: AppColor.white,
                    backgroundImage: AssetImage(AppImages.onboarding,
                    ),
                   ),
                    100.h.sbH,
                    AppText(AppStrings.description, weight: FontWeight.w600,
                    color: AppColor.textButtonColor,
                    align: TextAlign.center,
                    size: 38.sp,),
                 20.sp.sbH,
                 AppText('By continuing, you agree to our',
                 size: 13.sp,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        InkWell(onTap: (){},
                            child: AppText('Privacy Policy ', color: AppColor.primary, size: 13.sp,)),
                        AppText('and ', size: 13.sp,),
                        InkWell(onTap: (){},
                          child: AppText('Terms of Service', color: AppColor.primary, size: 13.sp,)),
                      ],),
                      20.sp.sbH,
                      AppButton(onPressed: (){
                        navigationService.navigateToWidget(LetUsKnowYou());
                      }, title: 'Continue with Google',
                      leadingIcon: AppImages.google,),
                      15.h.sbH,
                      AppButton(onPressed: (){
                        navigationService.navigateToWidget(const SignUp());
                      }, title: 'Continue with Email',
                        leadingIcon: AppImages.email,
                        buttonTextColor: AppColor.black,
                      buttonType: ButtonType.outline,)
                  ],),
                ))
              ],
            ),
          ),
        ));
  }
}
