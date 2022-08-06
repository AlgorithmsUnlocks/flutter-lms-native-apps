import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Components/default_button.dart';
import 'package:trainingtalenew/Screens/CourseSearch/courseDataShow.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:trainingtalenew/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  //Seaerching Query in Database
  TextEditingController controller = TextEditingController();
  String text = 'search course for ';
  Map? map;

  findCourseinFirebase() async{

    if(controller.text.isNotEmpty){
     await FirebaseFirestore.instance.collection('top').where('title',isEqualTo: controller.text).get().then((value) {
        for(var i in value.docs){
          setState(() {
            map = i.data();
          });
        }
      });
    }
    if(map?['title']== controller.text){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> NextPage(
        title: map?['title'],
        author: map?['author'],
        image: map?['image'],
        rating: map?['rating'],
        enrolled: map?['enrolled'],
        price: map?['price'],
        notPrice: map?['notPrice'],
        tag: map?['tag'],

      )));
    }
    else{
      setState(() {
        text = "Course is not found in this name : #${controller.text}";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

       body: ListView(
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 28.0),
             child: Container(
               child: Center(
                 child: Text('Welcome to You ',style: TextStyle(
                   fontSize: 25.0,
                   color: kPrimaryColor,
                   fontWeight: FontWeight.bold
                 ),),
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               controller: controller,
               decoration: InputDecoration(
                 prefixIcon: IconButton(onPressed: (){
                   Navigator.of(context).pop();
                 },
                     icon: Icon(Icons.arrow_back),
                   color: kPrimaryColor,
                   iconSize: 20.0,
                 ),
                 contentPadding: EdgeInsets.only(left: 25.0),
                 hintText: 'Search Any Courses for learn',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20.0))),
             ),
           ),
           /*
           TextField(
             controller: controller,
             decoration: InputDecoration(
               labelText: "find Course ",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0)
               )
             ),
           ),

            */
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               child: Center(
                 child:  DefaultButton(
                   text: 'Search Course',
                   press: (){
                      findCourseinFirebase();
                   },
                 )
               ),
             ),
           ),
           Center(child: Text(text))
         ],
       ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(EvaIcons.shoppingCart,color: kWhiteColor,),
            onPressed: () {
              Get.to(MyList());
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
          'Unique Search ',
          style: TextStyle(color: kWhiteColor),
        ),
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: kWhiteColor,),
          onPressed: (){
            Navigator.pushReplacement(context, PageTransition(child: HomeScreen(), type: PageTransitionType.fade));
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),
      ),
    );
  }
}
