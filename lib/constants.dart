import 'package:flutter/material.dart';
import 'package:trainingtalenew/size_config.dart';

const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryColor = Color(0xFF008089);
const kPrimaryColorWithOpacity = Color(0xFF008089);
const kSpashscreenColor = Color(0xFF5DB185);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kCongretesColor = Color(0xFFDD03F1);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFECDF),Color(0xFF03E5F1)],
);

const kSecondaryColor = Color(0xFF979797);
const kSecondaryColorNew = Color(0xFFEEEEEE);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5
);
const kDefaultDuration = Duration(milliseconds: 250);
