import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/Components/default_button.dart';
import 'package:trainingtalenew/Screens/OnboardingScreen/Components/onboard_content.dart';
import 'package:trainingtalenew/Screens/LoginScreen/LoggedInScreen.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Training Tale , Let’s Learn!",
      "image": "images/splash_1.png"
    },
    {
      "text":
      "Our most student are in \naround United kindom",
      "image": "images/splash_2.png"
    },
    {
      "text": "We provide best effort. \nKeep learining",
      "image": "images/splash_3.png"
    },
    {
      "text":
      "Our most student are in \naround United kindom",
      "image": "images/splash_2.png"
    },
    {
      "text": "We provide best effort. \nKeep learining",
      "image": "images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => OnboardContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Let's Continue",
                      press: () {
                        Navigator.pushReplacement(context,
                            PageTransition(
                                child: LoggedInScreen(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

}
