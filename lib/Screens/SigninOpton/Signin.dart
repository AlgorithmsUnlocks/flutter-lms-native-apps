import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:trainingtalenew/Screens/SigninOpton/SignUp.dart';
import 'package:trainingtalenew/Service/GoogleSignInProvider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                cursorColor: Colors.blue,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 30),
              TextField(
                cursorColor: Colors.blue,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon: Icon(Icons.lock_open, size: 32),
                  label: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40),
                  ),
                  icon: Icon(
                    EvaIcons.google,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Sign in with Google ',
                    style: TextStyle(fontSize: 18, color: Colors.yellowAccent),
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 10.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon: Icon(Icons.accessible, size: 32),
                  label: Text(
                    'Create An Account',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: SignUP(),
                            type: PageTransitionType.bottomToTop));
                  },
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/trainig.png'),
                fit: BoxFit.fitHeight,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken))),
      ),
    );
  }
}
