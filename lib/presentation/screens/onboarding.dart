import 'package:finance_app_ui/core/constants/color.dart';
import 'package:finance_app_ui/core/constants/image.dart';
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

  @override
  void initState() {
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoAnimation = Tween<double>(begin: -50.0.h, end: 80.0.h).animate(
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
                return Container(
                  height: 45.0.h,
                  width: 45.0.w,
                  margin: EdgeInsets.only(top: _logoAnimation.value),
                  color: Colors.transparent,
                  // Add your logo image or widget here
                  child: SvgPicture.asset(ImageConst.logo),
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
              onPageChanged: (index) {},
              children: const [
                Onboarding1(),
                Onboarding2(),
                Onbaording3(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
