import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trainingtalenew/Components/no_account_text.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';


class EmailVerification extends StatefulWidget {

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {

  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer){
      checkEmailVerified();
    });

    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF28ebe1),
                    Color(0xFFFFFFFF),
                  ],
                  stops: [
                    0.6,
                    0.9
                  ],
                  begin: Alignment.topLeft
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
                      "Welcome to You",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: getProportionateScreenWidth(34),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "An email is send to   \n${user.email}  \nplease verify !",
                      textAlign: TextAlign.center,style: TextStyle(
                      color: kBlackColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        "Note: After verify your email ,you will be redirect to Trainin Tale"
                            "within 5 seconds!",
                        textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                      ),
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
                    NoAccountText(),
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

  Future<void> checkEmailVerified() async{
    user = auth.currentUser!;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}

