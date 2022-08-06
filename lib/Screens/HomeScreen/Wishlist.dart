import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:trainingtalenew/Screens/DetailsSection/Fullcourse_details_Screen.dart';
import 'package:trainingtalenew/Screens/HomeScreen/MainDrawer.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Search.dart';
import 'package:trainingtalenew/Screens/NotoficationScreen/NotificationScreen.dart';
import 'package:trainingtalenew/Service/DataController.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';


class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
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
          'My Wishlist',
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

      body: StreamBuilder<dynamic>(
        stream:
        FirebaseFirestore.instance.collection("wishlist").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot wishlist = snapshot.data.docs[index];
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child:  CircularProgressIndicator(
                    backgroundColor: kPrimaryLightColor,
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: (){
                    Get.to(DetailsScreen(),
                        transition: Transition.leftToRightWithFade,
                        arguments: snapshot.data.docs[index]);
                  },
                  child: Card(
                    borderOnForeground: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        /*
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(.3),
                           spreadRadius: 2,
                           blurRadius: 5,
                           offset: Offset(0,2),
                         )
                       ],

                        */
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 85.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data.docs[index]
                                              .data()['image']),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    constraints:
                                    BoxConstraints(maxWidth: 285.0),
                                    child: Text(
                                      snapshot.data.docs[index]
                                          .data()["title"],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data.docs[index]
                                      .data()["author"],
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.yellow,
                                      size: 14,
                                    ),
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.yellow,
                                      size: 14,
                                    ),
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.yellow,
                                      size: 14,
                                    ),
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.yellow,
                                      size: 14,
                                    ),
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.yellow,
                                      size: 14,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        snapshot.data.docs[index]
                                            .data()['rating'],
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      ('(${snapshot.data.docs[index].data()['enrolled']})'),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.poundSign,
                                            size: 16,
                                            color: kPrimaryColor,
                                          ),
                                          Text(
                                            snapshot.data.docs[index]
                                                .data()['price'],
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snapshot.data.docs[index]
                                                .data()['notPrice'],
                                            style: TextStyle(
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
