import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Screens/CourseSearch/CoursesSeearch.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Home.dart';
import 'package:trainingtalenew/Screens/HomeScreen/MyCourses.dart';
import 'package:trainingtalenew/Screens/NotoficationScreen/NotificationScreen.dart';
import 'package:trainingtalenew/Screens/ProfileScreen/Profile_Screen.dart';
import 'package:trainingtalenew/Screens/SplashScreen.dart';
import 'package:trainingtalenew/SettingsScreen/Settings.dart';
import 'package:trainingtalenew/constants.dart';


class MainDrawerScreen extends StatelessWidget {


  const MainDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(25),
            color: kPrimaryColor,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30,bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://trainingtale.org/wp-content/uploads/2022/02/user-1.png'
                        ),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text(
                    'Sazia Akter Epti ',style: TextStyle(
                    color: kWhiteColor,fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                  ),
                  Text(
                    'sazia071@gmail.com',style: TextStyle(
                      color: kWhiteColor,fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings,color: kPrimaryColorWithOpacity,size: 30.0,),
            title: Text('Settings ',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
            ),),
            onTap: (){
              Navigator.pushReplacement(context, PageTransition(child: Setting(), type: PageTransitionType.fade));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.arrowLeft,color: kPrimaryColorWithOpacity,size: 30.0,),
            title: Text('Log Out ',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
            ),),
            onTap: (){
              logout(context);
            },
          ),
        ],
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
