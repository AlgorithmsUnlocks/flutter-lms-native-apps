import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Screens/HomeScreen/MainDrawer.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Screens/NotoficationScreen/NotificationScreen.dart';
import 'package:trainingtalenew/Service/DataController.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: Column(
         children: [
           Column(
             children: [
               Text('hello'),
             ],
           )
         ],
       ),
     ),

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
         'Course Search',
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
