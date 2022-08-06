import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trainingtalenew/Screens/HomeScreen/MainDrawer.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Search.dart';
import 'package:trainingtalenew/Screens/NotoficationScreen/NotificationScreen.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
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
            icon: Icon(Icons.notifications_active_outlined,color: kPrimaryLightColor,size: 25.0,),
            onPressed: () {
              Get.to(NotificationScreen());
            },
          ),
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(0.0))
        ),
        backgroundColor: kPrimaryColorWithOpacity,
        titleSpacing: 0,
        elevation: 10,
        title: Text(
          'My Courses',
          style: TextStyle(color: kWhiteColor),
        ),
        // centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),
        //drawer flutter
      ),
      drawer: MainDrawerScreen(),
    );
  }
}
