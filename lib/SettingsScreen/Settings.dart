import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/main.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25,),
              Text('Settings',style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold ),),
              SizedBox(height: 50,),
              Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,2),
                    )
                  ],
                ),
                child: TextButton.icon(
                    onPressed: () => MyApp.of(context)!.changedTheme(ThemeMode.light),
                  icon: Icon(Icons.highlight,size: 30,color: kWhiteColor,),
                    label: Text(
                      'Light Theme',style: TextStyle(
                      color: kWhiteColor,fontWeight: FontWeight.bold,
                      fontSize: 25,
                      height: 1.5
                    ),
                    )),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  color: kBlackColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,2),
                    )
                  ],
                ),
                child: TextButton.icon(
                    onPressed: () => MyApp.of(context)!.changedTheme(ThemeMode.dark),
                    icon: Icon(Icons.highlight,size: 30,color: kPrimaryColor,),
                    label: Text(
                      'Dark Theme',style: TextStyle(
                        color: kPrimaryColor,fontWeight: FontWeight.bold,
                        fontSize: 25,
                        height: 1.5
                    ),
                    )),
              ),

            ],
          ),
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
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(0.0))
        ),
        backgroundColor: kPrimaryColorWithOpacity,
        titleSpacing: 0,
        elevation: 10,
        title: Text(
          'Settings',
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
