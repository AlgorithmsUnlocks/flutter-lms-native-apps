import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainingtalenew/Model/models.dart';
import 'package:trainingtalenew/Model/Category_model.dart';
import 'package:trainingtalenew/Screens/DetailsSection/Course_Details.dart';
import 'package:trainingtalenew/widgets/hero_carousel_card.dart';
import 'package:trainingtalenew/widgets/reviews_carousel_card.dart';
import 'package:trainingtalenew/widgets/product_carosel.dart';
import 'package:trainingtalenew/widgets/Course_card.dart';
import 'package:trainingtalenew/widgets/Course_card_carosel.dart';
import 'package:get/get.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Container(
              height: 35.0,
              width: 400.0,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(0.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/offerTemp.png")
                  )
              ),
            ),*/
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
            /*

            Container(
              height: 150.0,
              width: 400.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/coverPicture.png"))),
            ),
            */
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Container(
                height: 60.0,
                width: 400.0,
                color: Colors.blue,
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
            SectionTitleDynamic(title: "Top Categories"),
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
                        return GestureDetector(
                          onTap: (){
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
                                      constraints: BoxConstraints(maxWidth: 200.0),
                                      child: Text(
                                        snapshot.data.docs[index].data()['title'],
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
                                      snapshot.data.docs[index].data()['author'],
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
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          snapshot.data.docs[index].data()['rating'],
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
                                      children: [
                                        Icon(FontAwesomeIcons.poundSign,size: 20,color: Colors.grey,),
                                        Text(
                                          snapshot.data.docs[index].data()['price'],
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 22),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data.docs[index].data()['tag'],
                                          style: TextStyle(
                                              color: Colors.grey,
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
                      },
                    );
                },
              ),
            ),

            SectionTitleDynamic(title: "Top Selling Courses"),
            //COurse Crad
            CourseCard(product: Product.product[0]),
            CourseCard(product: Product.product[1]),
            CourseCard(product: Product.product[2]),
            CourseCard(product: Product.product[3]),
/*
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, top: 20.0, bottom: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Our',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Top-Selling Courses',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

 */
/*
            //product card
            ProductCard(product: Product.product[1]),
            // Product Carosel
            ProductCarousel(product: Product.product),

 */
            SectionTitleDynamic(title: "Popular Courses"),
            ProductCarousel(
                product: Product.product.where((product) => product.isPopular)
                    .toList()
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

            // Course Card With New Features
            CourseCard(product: Product.product[0]),
            ProductCarousel(
                product: Product.product
                    .where((product) => product.isPopular)
                    .toList()),

          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(EvaIcons.shoppingBag),
            onPressed: () {
              print('Basket Window');
            },
          )
        ],
        backgroundColor: Colors.green,
        title: Text(
          'Featured',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
