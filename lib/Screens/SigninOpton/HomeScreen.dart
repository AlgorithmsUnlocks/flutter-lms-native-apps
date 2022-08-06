import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Featured.dart';
import 'package:trainingtalenew/Screens/HomeScreen/MyCourses.dart';
import 'package:trainingtalenew/Screens/ProfileScreen/Profile_Screen.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Cloud_Firestore_Search.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Wishlist.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Home.dart';
import 'package:trainingtalenew/size_config.dart';
import 'package:trainingtalenew/theme.dart';
import 'package:trainingtalenew/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = new PageController();
  int currentIndex = 0;

  void onTap(int page){
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [
          Home(),
          MyCourses(),
          Search(),
          Wishlist(),
          Profile()
        ],

      ),

      //Bottom Bar for Trainingtale LMS
      bottomNavigationBar: BottomAppBar(
        // color: Colors.black,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0,2),
              )
            ],
          ),
          height: 60,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.6,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: onTap,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: kCongretesColor,
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.home,color: kPrimaryColorWithOpacity,),
                  title: Text('Home',style: TextStyle(
                    color: kPrimaryColorWithOpacity
                  ),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_rounded,color: kPrimaryColorWithOpacity),
                  title: Text('Courses',style: TextStyle(
                      color: kPrimaryColorWithOpacity
                  ),),
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  title: Text('Search',style: TextStyle(
                      color: kPrimaryColorWithOpacity
                  ),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.heart,color: kPrimaryColorWithOpacity,),
                  activeIcon: Icon(FontAwesomeIcons.solidHeart,color: kPrimaryColorWithOpacity,),
                  title: Text('Wishlist',style: TextStyle(
                      color: kPrimaryColorWithOpacity
                  ),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person,color: kPrimaryColorWithOpacity,),
                  title: Text('Profile',style: TextStyle(
                      color: kPrimaryColorWithOpacity
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 10,
          child: Icon(Icons.search),
          backgroundColor: kPrimaryColorWithOpacity,
          onPressed: () => setState(() {
            currentIndex = 2;
          }),
        ),
      ),

    );
  }
}
