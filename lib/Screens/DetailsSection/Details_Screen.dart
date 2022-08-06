import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Service/VideoSetting/Video_player.dart';
import 'package:video_player/video_player.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Text(
                Get.arguments["title"],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              //details of our courses
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10.0),
                child: Text(
                  Get.arguments['courseDescrip'],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                               Get.arguments['rating'],
                               style: TextStyle(
                                 color: Colors.white,
                                   fontWeight: FontWeight.bold
                               ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.supervised_user_circle,
                                color: Colors.yellowAccent,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                '${Get.arguments['enrolled']} Enrolled',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.tag_faces,
                                color: Colors.yellowAccent,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text(
                                '${Get.arguments['tag']}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(
                          Icons.verified_user,
                          color: Colors.yellowAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          'Created By ${Get.arguments['author']} ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.timer_sharp,
                                  color: Colors.yellowAccent,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Text(
                                  Get.arguments['courseTime'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(
                                  Icons.upload_sharp,
                                  color: Colors.yellowAccent,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  'Date: ${Get.arguments['uploadDate']}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.language,
                          color: Colors.yellowAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          '${Get.arguments['language']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.dialog(Container(
                    child: VideoDisplay(
                      videoUrl: Get.arguments['trailer'],
                    ),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300.0,
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
                                  Get.arguments['image']
                                ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black45, BlendMode.darken)
                              )
                            ),
                          ),
                          Positioned(
                            child: Icon(Icons.play_arrow,color: Colors.white,
                            size: 100.0,),
                            top: 50.0,
                            left: 120.0,
                          ),
                          Positioned(
                            child:Text('Preview this courses',style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 22.0
                            ),),
                            top: 150.0,
                            left: 80.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Course Duration ',style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold,
                        fontSize: 18
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.redAccent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                child: IconButton(
                                  icon: Icon(Icons.timer,color: Colors.white),
                                  onPressed: (){
                                  },
                                ),
                              ),
                              Text(
                                Get.arguments['courseTime'],
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Course Curriculumn',style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,
                          fontSize: 18
                      )),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(EvaIcons.playCircle,color: Colors.yellow,size: 40,),
                title: Text(Get.arguments['unit1'],style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.normal
                ),),
              ),
              ListTile(
                leading: Icon(EvaIcons.playCircle,color: Colors.yellow,size: 40,),
                title: Text(Get.arguments['unit1'],style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),),
              ),
              ListTile(
                leading: Icon(EvaIcons.playCircle,color: Colors.yellow,size: 40,),
                title: Text(Get.arguments['unit1'],style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),),
              ),
              ListTile(
                leading: Icon(EvaIcons.playCircle,color: Colors.yellow,size: 40,),
                title: Text(Get.arguments['unit1'],style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),),
              ),
              ListTile(
                leading: Icon(EvaIcons.playCircle,color: Colors.yellow,size: 40,),
                title: Text(Get.arguments['unit1'],style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),),
              ),
              SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Course Reviews',style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,
                          fontSize: 18
                      )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0 ),
                child: Container(
                  height: 50.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade200,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Center(
                    child: Text(
                      'Take this Course',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,
                      fontSize: 24.0
                    ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade200

                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Add To Card',style: TextStyle(
                            color: Colors.black,fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade200

                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Add To Wishlist',style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
