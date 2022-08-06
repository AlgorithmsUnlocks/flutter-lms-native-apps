import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trainingtalenew/Screens/SigninOpton/LoggedInScreen.dart';


class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User ? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async{
    if(user!=null && user!.emailVerified){
      await user!.sendEmailVerification();
      print("Verification email has been sent !");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text("Verification email has been sent",style:
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.red
          ),),
       ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(EvaIcons.shoppingBag),
            onPressed: () {
              print('Basket Window');
            },
          )
        ],
        backgroundColor: Colors.blue,
        title: Text(
          'Profile ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(
            children: [
              SizedBox(
                height: 300.0,
                width: 400.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.green,
                          backgroundImage: AssetImage("images/user.png"),
                        )
                      ],
                    ),

                    Text(
                      'User ID : ',
                      style: TextStyle(color: Colors.white, fontSize: 24.0,
                      fontWeight: FontWeight.w900),
                    ),
                    Text(
                      uid,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Email Address  : ',
                        style: TextStyle(color: Colors.white, fontSize: 24.0,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            '$email',
                            style:
                            TextStyle(color: Colors.white, fontSize: 20.0,
                            fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    user!.emailVerified
                        ?
                    Text('Verify Email',style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepOrange,
                      fontWeight: FontWeight.w900
                    ),)
                        :
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 40.0),
                      child: Material(
                        color: Colors.blueAccent,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            verifyEmail();
                          },
                          child: Text(
                            'Verify Email',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
                child: Material(
                  color: Colors.blueAccent,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                    },
                    child: Text(
                      'Become An Instructor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Video Preference ',
                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                  fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'Download Option',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'Video Player Option',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Account Setting ',
                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'Account Security',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'Email Notification Preference',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'Learning Reminders',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Support ',
                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'About Training Tale',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'About Training Tale for Business',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'FAQs',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'Share the Apps',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Diagonostics',
                  style: TextStyle(color: Colors.white, fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    title: Text(
                      'Status',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon: Icon(Icons.wifi_protected_setup, size: 32),
                  label: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    logout(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Training Tale Version v1.0.05',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoggedInScreen()));
  }
}
