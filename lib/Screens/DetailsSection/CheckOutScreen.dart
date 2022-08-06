import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:trainingtalenew/Screens/CourseSearch/SearchPage.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Screens/DetailsSection/Course_Details.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Search.dart';
import 'package:trainingtalenew/Service/DataController.dart';
import 'package:trainingtalenew/constants.dart';



class MyCheckOutScreen extends StatefulWidget {

  const MyCheckOutScreen({Key? key}) : super(key: key);

  @override
  _MyCheckOutScreenState createState() => _MyCheckOutScreenState();
}

class _MyCheckOutScreenState extends State<MyCheckOutScreen> {
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
          'My Checkout',
          style: TextStyle(color: kWhiteColor),
        ),
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: kWhiteColor,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),
      ),



    );
  }
}
