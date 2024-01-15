import 'package:finance_app_ui/core/constants/color.dart';
import 'package:finance_app_ui/core/constants/image.dart';
import 'package:finance_app_ui/presentation/screens/welcome.dart';
import 'package:finance_app_ui/presentation/widgets/btns.dart';
import 'package:finance_app_ui/presentation/widgets/onboarding_1.dart';
import 'package:finance_app_ui/presentation/widgets/onboarding_2.dart';
import 'package:finance_app_ui/presentation/widgets/onboarding_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoAnimation;
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoAnimation = Tween<double>(begin: 00.0.h, end: 90.0.h).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the logo animation
    _logoController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: ColorConst.white,
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 45.0.h,
                    width: 45.0.w,
                    margin: EdgeInsets.only(top: _logoAnimation.value),
                    color: Colors.transparent,
                    // Add your logo image or widget here
                    child: SvgPicture.asset(ImageConst.logo),
                  ),
                );
              },
            ),
            Positioned(
              bottom: -70.0.h,
              left: -70.0.w,
              child: Container(
                width: 470.h,
                height: 470.w,
                decoration: const ShapeDecoration(
                  color: ColorConst.grey1,
                  shape: OvalBorder(),
                ),
              ),
            ),
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                Onboarding1(),
                Onboarding2(),
                Onbaording3(),
              ],
            ),
            Positioned(
              bottom: 40.0.h,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 4.0.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              child: index == currentIndex
                                  ? Container(
                                      width: 22.0.w,
                                      height: 5.0.h,
                                      decoration: BoxDecoration(
                                        color: ColorConst.primary,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    )
                                  : Container(
                                      width: 5.0.w,
                                      height: 5.0.h,
                                      decoration: const BoxDecoration(
                                        color: ColorConst.skyBlue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                    CustomBtn(
                      width: currentIndex == 2 ? 250.0.w : 153.0.w,
                      text: currentIndex == 2 ? "Lets Get Started" : null,
                      onTap: () {
                        if (currentIndex == 2) {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const WelcomeScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                    position: offsetAnimation, child: child);
                              },
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


