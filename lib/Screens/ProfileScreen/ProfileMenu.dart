import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trainingtalenew/Screens/SigninOpton/LoggedInScreen.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Screens/SplashScreen.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:get/get.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image(
                image: AssetImage(icon),
             // color: kPrimaryColor,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text,style: TextStyle(
              fontSize: 16
            ),)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}