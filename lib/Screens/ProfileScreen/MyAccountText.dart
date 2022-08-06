import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trainingtalenew/Screens/CourseSearch/SearchPage.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Screens/ProfileScreen/ProfileMenu.dart';
import 'package:trainingtalenew/Screens/ProfileScreen/GoogleProflePic.dart';
import 'package:trainingtalenew/Screens/ProfileScreen/Profile_Screen.dart';
import 'package:trainingtalenew/Screens/SigninOpton/LoggedInScreen.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Screens/SplashScreen.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Model/user_model.dart';

class MyAccountText extends StatefulWidget {

  const MyAccountText({Key? key}) : super(key: key);

  @override
  _MyAccountTextState createState() => _MyAccountTextState();
}

class _MyAccountTextState extends State<MyAccountText> {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
  final displayName = FirebaseAuth.instance.currentUser!.displayName;
  final userprofile = FirebaseAuth.instance.currentUser!.photoURL;

  User ? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(EvaIcons.shoppingCart,color: kWhiteColor,),
            onPressed: () {
              Get.to(MyList());
            },
          ),
          IconButton(
            icon: Icon(EvaIcons.search,color: kWhiteColor,),
            onPressed: () {
              Get.to(SearchPage());
            },
          )
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(0.0))
        ),
        backgroundColor: kPrimaryColorWithOpacity,
        titleSpacing: 0,
        elevation: 10,
        title: Text(
          'My Account',
          style: TextStyle(color: kWhiteColor),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor ),
          onPressed: () {
            Get.to(Profile(),
              transition: Transition.rightToLeftWithFade,
            );
          },
        ),
      ),
      /*
      appBar: AppBar(
        title: Text("Welcome to You"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kCongretesColor ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

       */
      backgroundColor: kPrimaryLightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              ProfilePic(),
              Text(
                displayName!,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: ()
              {}, child: Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(child: Text('Name :',style: TextStyle(
                      fontSize: 16
                  ),)),
                  Expanded(child: Text(
                    displayName!,
                    style: TextStyle(fontSize: 16.0),
                  ),),
                ],
              )),
              TextButton(onPressed: ()
              {}, child: Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(child: Text('Email :',style: TextStyle(
                      fontSize: 16
                  ),)),
                  Expanded(child: Text(
                    '$email',
                    style: TextStyle(fontSize: 16.0),
                  ),),
                ],
              )),
              TextButton(onPressed: ()
              {}, child: Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(child: Text('User ID :',style: TextStyle(
                      fontSize: 16
                  ),)),
                  Expanded(child: Text(
                    uid,
                    style: TextStyle(fontSize: 16.0),
                  ),),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ProfileMenu(
                  text: "Log Out",
                  icon: "images/logout.png",
                  press: () {
                    logout(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SplashScreen()));
  }

}
