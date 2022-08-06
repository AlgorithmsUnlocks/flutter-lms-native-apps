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

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),
        title: Card(
          color: kPrimaryColor,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: kWhiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0,2),
                )
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Courses....",),
              onChanged: (val){
                setState(() {
                  name = val;
                });
              },
            ),
          ),
        ),
        //drawer flutter
      ),
      drawer: MainDrawerScreen(),
      
      body: StreamBuilder<QuerySnapshot>(
        stream: (name!= "" && name != null)
        ? FirebaseFirestore.instance.collection('top').where('searchKey',arrayContains: name).snapshots()
        : FirebaseFirestore.instance.collection('top').snapshots(),
        builder: (context,snapshot){
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,index){
              DocumentSnapshot data = snapshot.data!.docs[index];
              return Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(data['title'],style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0
                      ),),
                      leading: CircleAvatar(
                        child: Image.network(
                          data['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        radius: 40,
                        backgroundColor: kWhiteColor,
                      ),
                      trailing:
                      GestureDetector(
                        onTap: () async{
                          await FirebaseFirestore.instance.collection('wishlist').add({
                            'title' : Get.arguments['title'],
                            'author' : Get.arguments['author'],
                            'courseDescrip' : Get.arguments['courseDescrip'],
                            'courseTime' : Get.arguments['courseTime'],
                            'enrolled' : Get.arguments['enrolled'],
                            'image' : Get.arguments['image'],
                            'language' : Get.arguments['language'],
                            'notPrice' : Get.arguments['notPrice'],
                            'price' : Get.arguments['price'],
                            'notPrice' : Get.arguments['notPrice'],
                            'rating' : Get.arguments['rating'],
                            'tag' : Get.arguments['tag'],
                            'unit1' : Get.arguments['unit1'],
                            'uploadDate' : Get.arguments['uploadDate'],
                          }).whenComplete(() {
                            Get.snackbar('Hurry Up', '${Get.arguments['title']} is added to Add to Cart',
                                colorText: kCongretesColor,snackPosition: SnackPosition.BOTTOM);
                          });
                        },
                        child: IconButton(
                          icon:Icon(EvaIcons.shoppingCart,color: kPrimaryColor,),
                          onPressed: () { },
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),

    );
  }
}
