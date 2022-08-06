import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Components/Social_card.dart';
import 'package:trainingtalenew/Components/default_button.dart';
import 'package:trainingtalenew/Components/no_account_text.dart';
import 'package:trainingtalenew/Screens/RegistrationScreen/EmailVerification.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:trainingtalenew/Screens/SigninOpton/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trainingtalenew/Service/GoogleSignInProvider.dart';
import 'package:provider/provider.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/size_config.dart';

import 'package:trainingtalenew/Screens/RegistrationScreen/SignUP.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoggedInScreen extends StatefulWidget {

  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {

  //Remember Properties
  bool? remember = false;

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {


    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Type Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Type a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,

        decoration: InputDecoration(
          fillColor: Colors.grey,
          labelText: "Email",
          focusColor: kPrimaryColor,
          hintText: "Enter Your Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(EvaIcons.google,color: kPrimaryColor,),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,

        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter Your Pssword",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(EvaIcons.lock,color: kPrimaryColor,),
        ));


    return Scaffold(
      backgroundColor: Colors.white,
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
                    0.7,
                    0.5
                  ],
                  begin: Alignment.topLeft
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: getProportionateScreenWidth(34),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password  \nor continue with gmail account",
                      textAlign: TextAlign.center,style: TextStyle(
                      color: kWhiteColor,
                    ),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Checkbox(
                          value: remember,
                          activeColor: kPrimaryColor,
                          onChanged: (value) {
                            setState(() {
                              remember = value;
                            });
                          },
                        ),
                        Text("Remember me"),
                        Spacer(),
                      ],
                    ),
                    DefaultButton(
                      text: "Login ",
                      press: (){
                        signIn(emailController.text, passwordController.text);
                      },
                    ),
                    SizedBox(height: 15),
                    DefaultButton(
                      text: "Signin With Google ",
                      press: (){
                        final provider = Provider.of<GoogleSignInProvider>(context,
                            listen: false);
                        provider.googleLogin().whenComplete(() {
                          Navigator.pushReplacement(context,
                              PageTransition(
                                  child: HomeScreen(),
                                  type: PageTransitionType.rightToLeftWithFade));
                        });
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    NoAccountText(),
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

// login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Greate,Your Login is Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => EmailVerification())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
