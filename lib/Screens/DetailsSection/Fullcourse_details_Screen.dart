import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Components/default_button.dart';
import 'package:trainingtalenew/Model/Review_model.dart';
import 'package:trainingtalenew/PaymentsGateWay/RazorPayGateway.dart';
import 'package:trainingtalenew/Screens/DetailsSection/PaymentsScreen.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Service/VideoSetting/Video_player.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/widgets/reviews_carousel_card.dart';
import 'package:video_player/video_player.dart';
import 'package:trainingtalenew/PaymentsGateWay/RazorPayGateway.dart';

import '../../size_config.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  final PaymentConroller paymentConroller = Get.put(PaymentConroller());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
              icon: Icon(
                EvaIcons.share,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                EvaIcons.shoppingCart,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(MyList());
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffffffff),
              Color(0xFFFFFFFF),
            ], stops: [
              0.7,
              0.5
            ], begin: Alignment.topLeft),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColorNew,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            //course image with video previews
                            child: GestureDetector(
                              onTap: () {
                                Get.dialog(Container(
                                  child: VideoDisplay(
                                    videoUrl: Get.arguments['trailer'],
                                  ),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 230.0,
                                  width: 400.0,
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 200.0,
                                          width: 400.0,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      Get.arguments['image']),
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.black45, BlendMode.darken))),
                                        ),
                                        Positioned(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 100.0,
                                          ),
                                          top: 50.0,
                                          left: 120.0,
                                        ),
                                        Positioned(
                                          child: Text(
                                            'Preview this courses',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22.0),
                                          ),
                                          top: 150.0,
                                          left: 80.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              Get.arguments["title"],
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
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
                                    Get.arguments['rating'],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  ),
                                ),
                                Text(
                                  ('( ${Get.arguments['enrolled']} students)'),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.poundSign,
                                      color: kPrimaryColor,size: 20.0,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 1.0),
                                      child: Text(
                                        Get.arguments['price'],
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        Get.arguments['notPrice'],
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 170,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        if(Get.arguments['price']=='45'){
                                          Navigator.pushReplacement(context, PageTransition(child: PaymentsScreen(),
                                              type: PageTransitionType.fade));
                                        }
                                      },
                                      child: Text('Enrolled Now',style: TextStyle(
                                          color: kWhiteColor,fontWeight: FontWeight.bold,fontSize: 16.0
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Course Reviews
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              height:50,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: TabBar(
                                  labelColor: kBlackColor,
                                  indicator: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  tabs: [
                                    Tab(text: 'Includes',),
                                    Tab(text: 'Outcomes',),
                                    Tab(text: 'Requirement',),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 300,

                              child: TabBarView(
                                children: [
                                  Container(
                                    child: Text('What is Include in this course'),
                                  ),
                                  Container(
                                    child: Text('What is Required in this course'),
                                  ),
                                  Container(
                                    child: Text('What is Include in this course'),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),














                  SizedBox(height: 50,),
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


                  //Add to cart and Add to wishlist
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: kCongretesColor),
                            child: GestureDetector(
                              onTap: () async {
                                await FirebaseFirestore.instance
                                    .collection('addtocart')
                                    .add({
                                  'title': Get.arguments['title'],
                                  'author': Get.arguments['author'],
                                  'courseDescrip': Get.arguments['courseDescrip'],
                                  'courseTime': Get.arguments['courseTime'],
                                  'enrolled': Get.arguments['enrolled'],
                                  'image': Get.arguments['image'],
                                  'language': Get.arguments['language'],
                                  'notPrice': Get.arguments['notPrice'],
                                  'price': Get.arguments['price'],
                                  'notPrice': Get.arguments['notPrice'],
                                  'rating': Get.arguments['rating'],
                                  'tag': Get.arguments['tag'],
                                  'unit1': Get.arguments['unit1'],
                                  'uploadDate': Get.arguments['uploadDate'],
                                }).whenComplete(() {
                                  Get.snackbar('Hurry Up',
                                      '${Get.arguments['title']} is added to Add to Cart',
                                      colorText: kCongretesColor,
                                      snackPosition: SnackPosition.BOTTOM);
                                });
                              },
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.yellowAccent),
                          child: GestureDetector(
                            onTap: () async {
                              await FirebaseFirestore.instance
                                  .collection('wishlist')
                                  .add({
                                'title': Get.arguments['title'],
                                'author': Get.arguments['author'],
                                'courseDescrip': Get.arguments['courseDescrip'],
                                'courseTime': Get.arguments['courseTime'],
                                'enrolled': Get.arguments['enrolled'],
                                'image': Get.arguments['image'],
                                'language': Get.arguments['language'],
                                'notPrice': Get.arguments['notPrice'],
                                'price': Get.arguments['price'],
                                'notPrice': Get.arguments['notPrice'],
                                'rating': Get.arguments['rating'],
                                'tag': Get.arguments['tag'],
                                'unit1': Get.arguments['unit1'],
                                'uploadDate': Get.arguments['uploadDate'],
                              }).whenComplete(() {
                                Get.snackbar('Hurry Up',
                                    '${Get.arguments['title']} is added to Wishlist',
                                    colorText: kCongretesColor,
                                    snackPosition: SnackPosition.BOTTOM);
                              });
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Add To Wishlist',
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Default Logo
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                        height: 60,
                        child: Image.asset(
                          "images/trainingtale.png",
                          fit: BoxFit.contain,
                        )),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}