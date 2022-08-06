import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trainingtalenew/Screens/SigninOpton/LoggedInScreen.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Screens/SplashScreen.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:get/get.dart';

class ProfilePic extends StatefulWidget {

  const ProfilePic({Key? key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
  final displayName = FirebaseAuth.instance.currentUser!.displayName;
  final userprofile = FirebaseAuth.instance.currentUser!.photoURL;

  User ? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 112,
        width: 112,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userprofile!),

            ),
            Positioned(
              right: -16,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: kPrimaryColor),
                    ),
                    primary: kPrimaryColor,
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.star_border_purple500_outlined),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
