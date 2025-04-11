import 'package:bucx/utils/pallet.dart';
import 'package:bucx/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'constants.dart';
import 'font_manager.dart';

Widget toast(String message, bool status) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 50,
      margin: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
      decoration: BoxDecoration(
          color: AppColor.white,
        borderRadius: BorderRadius.circular(8.sp),
        boxShadow: [
          BoxShadow(
            color: AppColor.grey.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: status == true ? AppColor.green : AppColor.errorColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.sp),bottomLeft: Radius.circular(8.sp)),
            ),
            width: 50.sp,
            child: Center(
              child: Icon(
                status == true ? Icons.check : Icons.error_outline,
                color: AppColor.white,
                size: 20.sp,
              ),
            ),
          ),
          10.sp.sbH,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: AppText(
                      message,
                      color: AppColor.black,
                      size: FontSize.s12,
                    ),
                  ),
                  Expanded(
                    child: Container(), // Spacer container for flexibility
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

snackBars(String message, bool status, {num? time}) {
  showToastWidget(
    position: ToastPosition(align: Alignment.topCenter),
    toast(message, status),
    duration: const Duration(seconds: 4),
    onDismiss: () {},
  );
}
