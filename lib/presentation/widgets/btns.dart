import 'package:finance_app_ui/core/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/color.dart';
import '../../core/constants/text_style.dart';

class CustomBtn extends StatelessWidget {
  final void Function()? onTap;
  final double? width;
  final String? text;
  final String? text2;
  const CustomBtn({
    super.key,
    this.onTap,
    this.width,
    this.text,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width ?? 153.0.w,
      height: 70.0.h,
      decoration: BoxDecoration(
        color: ColorConst.primary,
        borderRadius: BorderRadius.circular(28.0.r),
        image: DecorationImage(
          image: AssetImage(
            ImageConst.btnCoverPng,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(28.0.r),
          onTap: onTap,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: text == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              text2 ?? "Next",
                              style: mediumTextmontserrat(),
                            ),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: ColorConst.white,
                            ),
                          ],
                        )
                      : Text(
                          text!,
                          style: mediumTextmontserrat(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBorderBtn extends StatelessWidget {
  final String? text;
  final void Function()? onTap;
  final Icon? icon;
  const CustomBorderBtn({Key? key, this.text, this.onTap, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 70.0.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConst.primary, width: 2.0),
        borderRadius: BorderRadius.circular(28.0.r),
        color: ColorConst.white,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(28.0.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text ?? "Next",
                  style: mediumTextmontserrat()
                      .copyWith(color: ColorConst.primary),
                ),
                icon ??
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: ColorConst.primary,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
