import 'package:flutter/material.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:trainingtalenew/Screens/OnboardingScreen/Components/body.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
