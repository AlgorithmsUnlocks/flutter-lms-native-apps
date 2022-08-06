import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Screens/OnboardingScreen/OnboardingScreen.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/size_config.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    Timer(
      Duration(seconds: 4),
        () => Navigator.pushReplacement(context, PageTransition(
            child: OnBoardingScreen(), type: PageTransitionType.rightToLeftWithFade
        ))
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSpashscreenColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF28ebe1),
              Color(0xFFFFECDF),
            ],
            stops: [
              0.7,
              0.5
            ],
            begin: Alignment.topLeft
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height:300.0,
                child: Image.asset('images/trainingtale.png'),
              ),
              CircularProgressIndicator(
                backgroundColor: kPrimaryLightColor,
              )
            ],
          ),
        ),
      ),
    );
  }

}
