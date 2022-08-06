import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Screens/CourseSearch/SearchPage.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Screens/ProfileScreen/MyAccountText.dart';
import 'package:trainingtalenew/Screens/ProfileScreen/ProfileMenu.dart';
import 'package:trainingtalenew/Screens/ProfileScreen/GoogleProflePic.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Screens/SplashScreen.dart';
import 'package:trainingtalenew/constants.dart';




class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
  final displayName = FirebaseAuth.instance.currentUser!.displayName;

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
          'My Profile',
          style: TextStyle(color: kWhiteColor),
        ),
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor ),
          onPressed: () {
            Get.to(HomeScreen(),
              transition: Transition.leftToRightWithFade,
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),
      ),

      backgroundColor: kPrimaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                ProfilePic(),
                Text(
                  displayName!,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 30,),
                ProfileMenu(
                  text: "My Account",
                  icon: "images/user_info.png",
                  press: () => {
                    Navigator.pushReplacement(context, PageTransition(
                        child: MyAccountText(), type: PageTransitionType.leftToRightWithFade
                    ))
                  },
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: "images/notification.png",
                  press: () {
                    Navigator.pushReplacement(context, PageTransition(
                        child: MyAccountText(), type: PageTransitionType.leftToRightWithFade
                    ));
                  },
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "images/help.png",
                  press: () {
                    Navigator.pushReplacement(context, PageTransition(
                        child: MyAccountText(), type: PageTransitionType.leftToRightWithFade
                    ));
                  },
                ),
                ProfileMenu(
                  text: "Course Search",
                  icon: "images/help.png",
                  press: () {
                    Navigator.pushReplacement(context, PageTransition(
                        child: SearchPage(), type: PageTransitionType.leftToRightWithFade
                    ));
                  },
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "images/logout.png",
                  press: () {
                    logout(context);
                  },
                ),
              ],
            ),
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
