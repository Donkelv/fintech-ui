import 'package:finance_app_ui/core/constants/bottom_app_bar.dart';
import 'package:finance_app_ui/core/constants/color.dart';
import 'package:finance_app_ui/core/constants/image.dart';
import 'package:finance_app_ui/core/constants/text_style.dart';
import 'package:finance_app_ui/presentation/widgets/btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  int _page = 0;
  final PageController _pageController = PageController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ColorConst.white,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _page = page;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              children: screens.toList(),
            ),
            Positioned(
              top: 58.0.h,
              left: 20.0.w,
              child: IconButton.filled(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: ColorConst.white,
                ),
              ),
            ),
          ],
        ),
        drawer: const CustomDrawerWidget(),
        bottomNavigationBar: Container(
          width: size.width,
          decoration: const BoxDecoration(
            color: ColorConst.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 20,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 70.0.w, right: 70.0.w, top: 15.0.h, bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < bottomAppBarAsset.length; i++)
                  IconButton.filled(
                    onPressed: () {
                      _pageController.jumpToPage(i);
                    },
                    icon: SvgPicture.asset(
                      _page == i
                          ? bottomAppBarAsset[i].activeIcon
                          : bottomAppBarAsset[i].icon,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConst.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0.r),
          bottomRight: Radius.circular(20.0.r),
        ),
      ),
      width: 300.0.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          71.0.verticalSpace,
          const ProfileDrawerTop(),
          60.0.verticalSpace,
          CustomDrawerBtns(
            svg: ImageConst.payments,
            text: "Payments",
            onTap: () {},
          ),
          15.verticalSpace,
          CustomDrawerBtns(
            svg: ImageConst.transactions,
            text: "Transactions",
            onTap: () {},
          ),
          15.verticalSpace,
          CustomDrawerBtns(
            svg: ImageConst.card,
            text: "My Cards",
            onTap: (){},
          ),
          15.verticalSpace,
          CustomDrawerBtns(
            svg: ImageConst.promotions,
            text: "Promotions",
            onTap: () {},
          ),
          15.verticalSpace,
          CustomDrawerBtns(
            svg: ImageConst.savings,
            text: "Savings",
            onTap: () {},
          ),
          150.0.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: CustomBorderBtn(
              text: "Sign Out",
              onTap: () {},
              icon: const Icon(
                Icons.logout,
                color: ColorConst.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileDrawerTop extends StatelessWidget {
  const ProfileDrawerTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConst.profileImg),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 13.20,
                  offset: Offset(0, 4.80),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          8.0.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Otor John",
                style: normalTextmontserrat().copyWith(
                  color: ColorConst.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.0.verticalSpace,
              Text(
                "@Johnny25",
                style: smallTextmontserrat().copyWith(
                  color: ColorConst.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDrawerBtns extends StatelessWidget {
  final String svg;
  final String text;
  final void Function()? onTap;
  const CustomDrawerBtns({
    super.key,
    required this.svg,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 34.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(svg),
                    SizedBox(
                      width: 35.0.w,
                    ),
                    Text(
                      text,
                      style: mediumTextmontserrat().copyWith(
                        color: ColorConst.primary,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 10.0.w,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: ColorConst.primary,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
