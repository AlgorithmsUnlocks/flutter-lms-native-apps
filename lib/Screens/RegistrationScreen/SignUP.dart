import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:trainingtalenew/Components/default_button.dart';
import 'package:trainingtalenew/Components/have_account_text.dart';
import 'package:trainingtalenew/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trainingtalenew/Screens/LoginScreen/LoggedInScreen.dart';
import 'package:trainingtalenew/Components/no_account_text.dart';
import 'package:email_auth/email_auth.dart';
import 'package:trainingtalenew/Screens/RegistrationScreen/EmailVerification.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:trainingtalenew/Service/GoogleSignInProvider.dart';

import '../../constants.dart';
import '../../size_config.dart';




class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,

        decoration: InputDecoration(
          labelText: "First Name",
          hintText: "Enter Your First Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.account_circle,color: kPrimaryColor,),
        ));

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,

        decoration: InputDecoration(
          labelText: "Last Name",
          hintText: "Enter Your Last Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.account_circle,color: kPrimaryColor,),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,

        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter Your Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(EvaIcons.google,color: kPrimaryColor,),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
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
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,

        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter Your Pssword",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(EvaIcons.lock,color: kPrimaryColor,),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,

        decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Confirm Password",
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
                    Color(0xFFFFFFFF),
                    Color(0xFFDD03F1),
                    Color(0xFF28ebe1),
                  ],
                  stops: [
                    0.7,
                    0.1,
                    0.2
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
                      "Register an Account",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password  \nor continue with gmail account",
                      textAlign: TextAlign.center,style: TextStyle(
                      color: kSecondaryColor,
                    ),
                    ),
                    SizedBox(height: 30),
                    firstNameField,
                    SizedBox(height: 25),
                    secondNameField,
                    SizedBox(height: 25),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 25),
                    confirmPasswordField,
                    SizedBox(height: 35),
                    DefaultButton(
                      text: "Sign Up ",
                      press: (){
                        signUp(emailEditingController.text, passwordEditingController.text);
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
                    SizedBox(height: 25),
                    HaveAccountText(),
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Please confirm in email for next step:) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => EmailVerification()),
            (route) => false);
  }

}