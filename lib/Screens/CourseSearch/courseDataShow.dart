import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainingtalenew/Screens/CourseSearch/SearchPage.dart';

import '../../constants.dart';

class NextPage extends StatelessWidget {

  String? title,author,image,rating,enrolled,price,notPrice,tag;

  NextPage({
    this.title,
    this.author,
    this.image,
    this.rating,
    this.enrolled,
    this.price,
    this.notPrice,
    this.tag,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result '),
      ),
     /*
      body: Column(
        children: [
          Text("Title :" + title.toString()),
          Text("Author : " + author.toString()),
        ],
      ),
      */
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 300.0,
            width: 400.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(.2),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0,2),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(
                                image.toString(),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        constraints:
                        BoxConstraints(maxWidth: 400.0),
                        child: Text(
                          title.toString(),
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
                        author.toString(),
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
                            rating.toString(),
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          ),
                        ),
                        Text(
                          (enrolled.toString()),
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.poundSign,
                                size: 20,
                                color: kPrimaryColor,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  price.toString(),
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  (notPrice.toString()),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.tags,
                                size: 20,
                                color: kPrimaryColor,
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
                                      tag.toString(),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

/*
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400.0,
            width: 400.0,
            child: StreamBuilder<dynamic>(
              stream:
              FirebaseFirestore.instance.collection("top").snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
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
                        onTap: () {
                          Get.to(DetailsScreen(),
                              transition: Transition.leftToRightWithFade,
                              arguments: snapshot.data.docs[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: kPrimaryColor.withOpacity(.2),
                                  spreadRadius: 7,
                                  blurRadius: 5,
                                  offset: Offset(0,2),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 400.0,
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
                                    BoxConstraints(maxWidth: 400.0),
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
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.poundSign,
                                            size: 20,
                                            color: kPrimaryColor,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              snapshot.data.docs[index]
                                                  .data()['price'],
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: Text(
                                              (snapshot.data.docs[index].data()['notPrice']),
                                              style: TextStyle(
                                                  decoration: TextDecoration.lineThrough,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.tags,
                                            size: 20,
                                            color: kPrimaryColor,
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
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ),
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
          ),
        ),

      ),

 */


    );
  }
}
