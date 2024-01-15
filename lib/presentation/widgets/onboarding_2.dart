

import 'package:finance_app_ui/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/image.dart';
import '../../core/constants/text_style.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        200.verticalSpace,
        Image.asset(
          ImageConst.onboarding2,
          width: 246.0.w,
          height: 203.0.h,
        ),
        187.0.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.0.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Secure your money for free and get rewards.",
                  textAlign: TextAlign.start,
                  style: largeTextmontserrat().copyWith(
                    color: ColorConst.primary,
                    fontWeight: FontWeight.w700
                  ),
                ),
                22.0.verticalSpace,
                Text(
                  "Get the ost secure payment app ever and enjoy it.",
                  textAlign: TextAlign.start,
                  style: mediumTextmontserrat().copyWith(
                    color: ColorConst.primary1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}