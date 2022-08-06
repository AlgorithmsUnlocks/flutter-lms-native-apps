import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:trainingtalenew/Components/default_button.dart';


class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFDD03F1),
                    Color(0xFFFFFFFF),
                  ],
                  stops: [
                    1,
                    0.5
                  ],
                  begin: Alignment.topRight
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      "Congratutaion",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: getProportionateScreenWidth(34),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Happy learning  \nfrom today",
                      textAlign: TextAlign.center,style: TextStyle(
                      color: kWhiteColor,
                    ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    DefaultButton(
                      text: 'Go to Home',
                      press: (){
                        Navigator.pushReplacement(context,
                            PageTransition(
                                child: HomeScreen(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                          height: 60,
                          child: Image.asset(
                            "images/trainingtale.png",
                            fit: BoxFit.contain,
                          )),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}