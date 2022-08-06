import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trainingtalenew/Screens/DetailsSection/Details_Screen.dart';
import 'package:trainingtalenew/constants.dart';

class CourseSearchScreen extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('top');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(FontAwesomeIcons.windowClose),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.arrowLeft),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            ));
          } else {
            //fetch data from cloud firestore
            print(snapshot.data);
            return ListView(
              children: [
                ...snapshot.data!.docs.where(
                    (QueryDocumentSnapshot<Object?> element) =>
                        element['title'].toString().toLowerCase().contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data) {

                          final String title = data.get('title');
                          final String image = data.get('image');
                          final String author = data['author'];
                          final String rating = data.get('rating');

                          return ListTile(
                            onTap: (){
                              Navigator.pushReplacement(context, PageTransition(child: DetailsScreen(),
                                  type: PageTransitionType.topToBottom));
                            },
                            title: Text(title),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(image),
                            ),
                            subtitle: Text(author),
                          );
                }),
              ],
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Anything hwere !'),
    );
  }
}
