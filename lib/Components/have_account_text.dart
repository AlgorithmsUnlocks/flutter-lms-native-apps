import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Screens/LoginScreen/LoggedInScreen.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:trainingtalenew/Screens/RegistrationScreen/SignUP.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context,
                PageTransition(
                    child: LoggedInScreen(),
                    type: PageTransitionType.leftToRightWithFade));
          },
          child: Text(
            "Sign In",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}