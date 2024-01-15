import 'package:finance_app_ui/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/image.dart';
import '../../core/constants/text_style.dart';

class Onbaording3 extends StatelessWidget {
  const Onbaording3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        200.verticalSpace,
        Image.asset(
          ImageConst.onboarding3,
          width: 246.0.w,
          height: 203.0.h,
        ),
        187.0.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 35.0.w, right: 40.0.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enjoy commission-free stock trading.",
                  textAlign: TextAlign.start,
                  style: largeTextmontserrat().copyWith(
                    color: ColorConst.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                22.0.verticalSpace,
                Text(
                  "Online investing has never been easier than it is right now.",
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
