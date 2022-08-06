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
    return Scaffold(
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
            Color(0xFF28ebe1),
            Color(0xFFFFFFFF),
          ], stops: [
            0.7,
            0.5
          ], begin: Alignment.topLeft),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: Text(
                    Get.arguments["title"],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
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
                  child: Text(
                    Get.arguments["courseDescrip"],
                    style: TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ),

                //Course details
                Container(
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
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                              child: Text(
                            'Course Details',
                            style: TextStyle(color: kBlackColor, fontSize: 22),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 5,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.access_time,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["courseTime"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.userGraduate,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["enrolled"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.signLanguage,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["language"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.poundSign,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["notPrice"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.poundSign,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["price"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["rating"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.tags,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["tag"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.calendarTimes,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["uploadDate"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.chalkboardTeacher,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: Text(
                                  Get.arguments["author"],
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Course Curriculumn

                Container(
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
                        Container(
                          child: Center(
                              child: Text(
                            'Course Curriculumn',
                            style: TextStyle(color: kBlackColor, fontSize: 22),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 5,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    Get.arguments["unit1"],
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Course Reviews
                Container(
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
                        Container(
                          child: Center(
                              child: Text(
                            'Course Learners',
                            style: TextStyle(color: kBlackColor, fontSize: 22),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 5,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
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
                  items: Reviews.reviews
                      .map((reviews) => ReviewesCarouselCard(reviews: reviews))
                      .toList(),
                )),

                //Course Buy Button

                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF28ebe1),
                        Color(0xFFFFFFFF),
                      ], stops: [
                        0.7,
                        0.5
                      ], begin: Alignment.topLeft),
                    ),
                    child: DefaultButton(
                      text: "Take This Course",
                      press: () {
                        if(Get.arguments['price']=='500'){
                          Navigator.pushReplacement(context, PageTransition(child: PaymentsScreen(),
                              type: PageTransitionType.fade));
                        }
                      },
                    ),
                  ),
                ),

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
    );
  }
}
