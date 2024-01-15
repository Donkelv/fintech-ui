import 'package:finance_app_ui/core/constants/color.dart';
import 'package:finance_app_ui/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        66.verticalSpace,
        Image.asset("name"),
        187.0.verticalSpace,
        Padding(
          padding:  EdgeInsets.only(left: 35.0.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Save your money conviniently.", textAlign: TextAlign.start, style: largeTextmontserrat().copyWith(color: ColorConst.primary,) ,),
                22.0.verticalSpace,
                Text(
                  "Get 5% back for each transaction and spend it easily.",
                  textAlign: TextAlign.start,
                  style: mediumTextmontserrat().copyWith(
                    color: ColorConst.primary1,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}