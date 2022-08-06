import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Screens/SigninOpton/Signin.dart';

class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: SizedBox(
            height: 400.0,
            width: 400.0,
            child: Image.asset('images/trainig.png',fit: BoxFit.fitWidth,
            colorBlendMode: BlendMode.darken,color: Colors.black54,),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:const EdgeInsets.all(15.0),
             child: MaterialButton(onPressed: (){

              print('Pressed');
            },
                child: Text('Browse',style: TextStyle(color: Colors.grey.shade400,fontSize: 20.0)
                )
            ),

            ),

            MaterialButton(onPressed: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SignIn()
              ));
            },
                child: Text('Sign In',style: TextStyle(color: Colors.grey.shade400,fontSize: 20.0)
                )
            )
          ],
        ),
      ),
    );
  }
}
