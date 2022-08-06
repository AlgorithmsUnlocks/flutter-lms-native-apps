import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:trainingtalenew/Screens/CourseSearch/SearchPage.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CheckOutScreen.dart';
import 'package:trainingtalenew/Screens/DetailsSection/Course_Details.dart';
import 'package:trainingtalenew/Screens/DetailsSection/PaymentsScreen.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Search.dart';
import 'package:trainingtalenew/Service/DataController.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/size_config.dart';




class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
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
          'My Cart',
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

      body: StreamBuilder<dynamic>(
        stream:
        FirebaseFirestore.instance.collection("addtocart").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot addtocart = snapshot.data.docs[index];
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child:  CircularProgressIndicator(
                    backgroundColor: kPrimaryLightColor,
                  ),
                );
              } else {
               return GestureDetector(
                 onTap: (){
                   Get.to(MyCheckOutScreen(),
                       transition: Transition.fade,
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


      /*
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 400.0,
                width: 400.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(EvaIcons.archive,color: Colors.white,),
                      radius: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Your Wishlist is empty',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Noting is shown here',style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Training Tale categories ',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(EvaIcons.browserOutline,color: Colors.yellow,),
                title: Text('Education and Training',style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(EvaIcons.browserOutline,color: Colors.yellow,),
                title: Text('Education and Training',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(EvaIcons.browserOutline,color: Colors.yellow,),
                title: Text('Education and Training',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(EvaIcons.browserOutline,color: Colors.yellow,),
                title: Text('Education and Training',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(EvaIcons.browserOutline,color: Colors.yellow,),
                title: Text('Education and Training',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(EvaIcons.browserOutline,color: Colors.yellow,),
                title: Text('Education and Training',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(EvaIcons.browserOutline,color: Colors.yellow,),
                title: Text('Education and Training',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
              ),

            ],
          ),

        ),
      ),
       */
      /*
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 500.0,
            width: 400.0,
            child: StreamBuilder<dynamic>(
              stream:
              FirebaseFirestore.instance.collection("addtocart").snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(

                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot addtocart = snapshot.data.docs[index];
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child:  CircularProgressIndicator(
                          backgroundColor: kPrimaryLightColor,
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Get.to(PaymentsScreen(),
                              transition: Transition.leftToRightWithFade,
                              arguments: snapshot.data.docs[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dismissible(
                            key: Key(snapshot.data.docs[index].toString()),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction){
                              setState(() {
                                snapshot.data.removeAt(index);
                              });
                            },
                            background: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(Icons.delete,color: kCongretesColor,),
                                ],
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 88,
                                  child: AspectRatio(
                                    aspectRatio: 0.88,
                                    child: Container(
                                     padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(15),),

                                      ),
                                    ),
                                  ),
                                SizedBox(height: 30,),

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
          ),
        ),



      ),

       */
    );
  }
}
