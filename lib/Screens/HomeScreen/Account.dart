import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:trainingtalenew/Screens/SigninOpton/LoggedInScreen.dart';
import 'package:trainingtalenew/Screens/SplashScreen.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          'Account ',
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
                    Text(
                      'Sazia Akter Epti',
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(EvaIcons.google, color: Colors.white),
                          Text(
                            'sazaiakter@gmail.com',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          'Become An Instructor',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Video Preference ',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'Download Option',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'Video Player Option',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Text(
                'Account Setting',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'Account Security',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'Email Notification Preference',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'Learning Reminders',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Text(
                'Support',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'About Training Tale',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'About Training Tale for Business',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'FAQs',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'Share the Apps ',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Text(
                'Diagonostics',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                title: Text(
                  'Status',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    logout(context);
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ),
              Text(
                'Training Tale Version v1.0.05',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14.0,
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
