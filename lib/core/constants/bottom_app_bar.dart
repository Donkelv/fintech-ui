import 'package:finance_app_ui/core/constants/color.dart';
import 'package:finance_app_ui/core/constants/image.dart';
import 'package:finance_app_ui/core/constants/text_style.dart';
import 'package:finance_app_ui/presentation/screens/wallet.dart';
import 'package:flutter/material.dart';

class BottomAppbarAsset {
 
  final String icon;
  final String activeIcon;

  BottomAppbarAsset(
      {required this.icon, required this.activeIcon});
}

List<Widget> screens = [
  const WalletScreen(),
  Center(
    child: Text("Notification", style: mediumTextmontserrat().copyWith(color: ColorConst.grey,),),
  ),
  Center(
    child: Text(
      "Profile",
      style: mediumTextmontserrat().copyWith(
        color: ColorConst.grey,
      ),
    ),
  ),
];

List<BottomAppbarAsset> bottomAppBarAsset = [
  BottomAppbarAsset(
   
    icon: ImageConst.activeWallet,
    activeIcon: ImageConst.activeWallet,
  ),
  BottomAppbarAsset(
      
      icon: ImageConst.notification,
      activeIcon: ImageConst.notification),
  BottomAppbarAsset(
     
      icon: ImageConst.profile,
      activeIcon: ImageConst.profile),
  
];
