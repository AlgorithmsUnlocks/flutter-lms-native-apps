import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Components/Stepper.dart';
import 'package:trainingtalenew/Components/default_button.dart';
import 'package:trainingtalenew/Model/Review_model.dart';
import 'package:trainingtalenew/PaymentsGateWay/RazorPayGateway.dart';
import 'package:trainingtalenew/Screens/HomeScreen/MainDrawer.dart';
import 'package:trainingtalenew/Screens/DetailsSection/CartScreen.dart';
import 'package:trainingtalenew/Screens/NotoficationScreen/NotificationScreen.dart';
import 'package:trainingtalenew/Service/VideoSetting/Video_player.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:trainingtalenew/widgets/reviews_carousel_card.dart';
import 'package:video_player/video_player.dart';
import 'package:trainingtalenew/PaymentsGateWay/RazorPayGateway.dart';
import 'package:trainingtalenew/size_config.dart';


class PaymentsScreen extends StatefulWidget {

  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {

  final PaymentConroller paymentConroller = Get.put(PaymentConroller());

  final email = FirebaseAuth.instance.currentUser!.email;
  final displayName = FirebaseAuth.instance.currentUser!.displayName;
  final phoneNum = FirebaseAuth.instance.currentUser!.phoneNumber;

  User ? user = FirebaseAuth.instance.currentUser;

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
          'Payments Details',
          style: TextStyle(color: kWhiteColor),
        ),
        // centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        //drawer flutter
      ),
     // drawer: MainDrawerScreen(),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFF28ebe1),
                  ],
                  stops: [
                    0.7,
                    0.5
                  ],
                  begin: Alignment.topLeft
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      "Happy Learning",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(34),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "If you feel any doubt  \nknock us ",
                      textAlign: TextAlign.center,style: TextStyle(
                      color: kPrimaryColor,
                    ),
                    ),
                    SizedBox(height: 20,),
                    MyStepper(),
                    DefaultButton(
                      text: "Online Payment ",
                      press: (){
                        paymentConroller.dispatchPayment(
                            250,
                            '$phoneNum',
                            'Online Payment',
                            '$email',
                            'Google Pay',
                            '$displayName'
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    DefaultButton(
                      text: "Offline Payment ",
                      press: (){
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
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
                    )
                  ],
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
