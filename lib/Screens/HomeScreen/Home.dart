import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Model/Category_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:trainingtalenew/Model/models.dart';
import 'package:trainingtalenew/Screens/CourseCategories/CourseCategories.dart';
import 'package:trainingtalenew/Screens/HomeScreen/CourseSearchScreen.dart';
import 'package:trainingtalenew/Screens/HomeScreen/MainDrawer.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Wishlist.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Screens/NotoficationScreen/NotificationScreen.dart';
import 'package:trainingtalenew/Service/DataController.dart';
import 'package:trainingtalenew/widgets/hero_carousel_card.dart';
import 'package:trainingtalenew/widgets/reviews_carousel_card.dart';
import 'package:trainingtalenew/widgets/product_carosel.dart';
import 'package:trainingtalenew/widgets/Course_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainingtalenew/Service/DataController.dart';
import 'package:trainingtalenew/Screens/DetailsSection/Course_Details.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constants.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _searchController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                        'Hey ,Best Wishesh!',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        'Find a course that you need to learn !',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0,2),
                          )
                        ],
                      ),
                      child: Center(
                        child: TextField(
                          cursorColor: Colors.black,
                          controller: _searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search for courses',
                              prefixIcon: Icon(EvaIcons.search,color:
                              Colors.black.withOpacity(0.8),)
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: Container(
                      height: 60.0,
                      width: 400.0,
                      color: kPrimaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Grave Your Free Course ',
                            style: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'Now for Lifetime ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SectionTitleDynamic(title: "Our Best Selling Courses"),
                      ],
                    ),
                  ),
                  Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1.5,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          initialPage: 2,
                          autoPlay: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: Category.categories
                            .map((category) => HeroCaroselCard(category: category))
                            .toList(),
                      )),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0,left: 8.0,right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SectionTitleDynamic(title: "Top Categories"),
                        SectionTitleDynamic(title: "See All"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SectionTitleDynamic(title: "Top Selling Courses"),
            //Course Top selling
            Container(
              height: 400.0,
              width: 400.0,
              child: StreamBuilder<dynamic>(
                stream:
                    FirebaseFirestore.instance.collection("top").snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot top = snapshot.data.docs[index];
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          child:  CircularProgressIndicator(
                            backgroundColor: kPrimaryLightColor,
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Get.to(DetailsScreen(),
                                transition: Transition.leftToRightWithFade,
                                arguments: snapshot.data.docs[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 110.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(
                                              snapshot.data.docs[index]
                                                  .data()['image'],
                                            ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      constraints:
                                      BoxConstraints(maxWidth: 200.0),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      snapshot.data.docs[index]
                                          .data()['author'],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
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
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        ('(${snapshot.data.docs[index].data()['enrolled']})'),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.poundSign,
                                          size: 20,
                                          color: kPrimaryColor,
                                        ),
                                        Text(
                                          snapshot.data.docs[index]
                                              .data()['price'],
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 22),
                                        ),
                                        Text(
                                          snapshot.data.docs[index]
                                              .data()['notPrice'],
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data.docs[index]
                                              .data()['tag'],
                                          style: TextStyle(
                                              color: kWhiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
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
            ),
            SectionTitleDynamic(title: "Featured Courses"),
            //Course Top selling
            Container(
              height: 400.0,
              width: 400.0,
              child: StreamBuilder<dynamic>(
                stream: FirebaseFirestore.instance
                    .collection("features")
                    .snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot top = snapshot.data.docs[index];
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          child:  CircularProgressIndicator(
                            backgroundColor: kPrimaryLightColor,
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Get.to(DetailsScreen(),
                                transition: Transition.leftToRightWithFade,
                                arguments: snapshot.data.docs[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 110.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(
                                              snapshot.data.docs[index]
                                                  .data()['image'],
                                            ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      constraints:
                                      BoxConstraints(maxWidth: 200.0),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      snapshot.data.docs[index]
                                          .data()['author'],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
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
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        ('(${snapshot.data.docs[index].data()['enrolled']})'),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.poundSign,
                                          size: 20,
                                          color: kPrimaryColor,
                                        ),
                                        Text(
                                          snapshot.data.docs[index]
                                              .data()['price'],
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 22),
                                        ),
                                        Text(
                                          snapshot.data.docs[index]
                                              .data()['notPrice'],
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data.docs[index]
                                              .data()['tag'],
                                          style: TextStyle(
                                              color: kWhiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
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
            ),
            //COurse Crad
            SectionTitleDynamic(title: "Popular Courses"),
            Container(
              height: 400.0,
              width: 400.0,
              child: StreamBuilder<dynamic>(
                stream:
                FirebaseFirestore.instance.collection("top").snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot top = snapshot.data.docs[index];
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          child:  CircularProgressIndicator(
                            backgroundColor: kPrimaryLightColor,
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Get.to(DetailsScreen(),
                                transition: Transition.leftToRightWithFade,
                                arguments: snapshot.data.docs[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 110.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(
                                              snapshot.data.docs[index]
                                                  .data()['image'],
                                            ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      constraints:
                                      BoxConstraints(maxWidth: 200.0),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      snapshot.data.docs[index]
                                          .data()['author'],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellow,
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
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        ('(${snapshot.data.docs[index].data()['enrolled']})'),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.poundSign,
                                          size: 20,
                                          color: kPrimaryColor,
                                        ),
                                        Text(
                                          snapshot.data.docs[index]
                                              .data()['price'],
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 22),
                                        ),
                                        Text(
                                          snapshot.data.docs[index]
                                              .data()['notPrice'],
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data.docs[index]
                                              .data()['tag'],
                                          style: TextStyle(
                                              color: kWhiteColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
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
            ),
            SectionTitleDynamic(title: "Our Greate Learners"),
            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 2,
                autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Reviews.reviews
                  .map((reviews) => ReviewesCarouselCard(reviews: reviews))
                  .toList(),
            )),

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
          'Home',
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
