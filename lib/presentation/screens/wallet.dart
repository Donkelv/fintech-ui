
import 'package:finance_app_ui/core/constants/color.dart';
import 'package:finance_app_ui/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/image.dart';
//import 'dart:math';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: size.width,
              height: 280.0.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4960F9),
                    Color(0xFF1937FE),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(65.0.r),
                  bottomLeft: Radius.circular(65.0.r),
                ),
              ),
            ),
          ),
          Positioned(
            top: 64.0.h,
            left: 0.0,
            right: 0.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70.w,
                    height: 70.h,
                    margin: EdgeInsets.only(right: 20.0.w),
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
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 60.0.w),
                    child: Text(
                      "Good morning\nJohnny25,",
                      style: semiLargeTextmontserrat(),
                    ),
                  ),
                ),
                46.0.verticalSpace,
                Container(
                  width: size.width,
                  height: 339.0.h,
                  margin: EdgeInsets.symmetric(horizontal: 50.0.w),
                  decoration: BoxDecoration(
                    color: ColorConst.white,
                    borderRadius: BorderRadius.circular(40.0.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 50,
                        offset: Offset(0, 9),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 28.0.w, vertical: 28.0.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Your total balance",
                              style: normalTextmontserrat().copyWith(
                                color: ColorConst.grey,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            const Icon(
                              Icons.more_horiz_outlined,
                              color: ColorConst.grey,
                            ),
                          ],
                        ),
                        //4.0.verticalSpace,
                        Text(
                          "\$8500.00",
                          style: largestTextmontserrat().copyWith(
                            color: ColorConst.skyBlue,
                          ),
                        ),
                        26.0.verticalSpace,
                        SvgPicture.asset(ImageConst.barChart, fit: BoxFit.scaleDown,)
                      ],
                    ),
                  ),
                  //child: Barchart(),
                ),
                24.0.verticalSpace,
                Container(
                  width: size.width,
                  height: 146.0.h,
                  margin: EdgeInsets.symmetric(horizontal: 50.0.w),
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(1.00, -0.10),
                      end: Alignment(-1, 0.1),
                      colors: [Color(0xFF2960F9), Color(0xFF1332FF)],
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          ImageConst.walletMaskedGroup,
                        ),
                        fit: BoxFit.fitWidth),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                       borderRadius: BorderRadius.circular(40),
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Check your\nbank accounts",
                              style: semiLargeTextmontserrat(),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: ColorConst.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Barchart extends StatelessWidget {
//   const Barchart({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 2,
//       child: BarChart(
//         BarChartData(
//           barGroups: _chartGroups(),
//           borderData: FlBorderData(
//             show: false,
//               border: const Border(bottom: BorderSide(), left: BorderSide(),),),
//           gridData: FlGridData(show: false),
//           titlesData: FlTitlesData(
//             bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//             rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           ),
//         ),
//       ),
//     );
//   }


//    List<BarChartGroupData> _chartGroups() {
//     return points.map((point) {
//       final num y = (Random().nextBool() ? 1 : -1) * point.y;
//       return BarChartGroupData(x: point.x.toInt(), barRods: [
//         BarChartRodData(
//           toY: y.toDouble(),
//           color: y > 0 ? Colors.blue : Colors.red,
//         )
//       ]);
//     }).toList();
//   }
// }


