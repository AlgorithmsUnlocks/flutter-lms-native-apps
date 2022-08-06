import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trainingtalenew/Service/DataController.dart';
import 'package:trainingtalenew/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();

  late QuerySnapshot snapshotData;
  bool isExcecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Scaffold(

          );
        },
      );
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          isExcecuted = false;
        },
      ),
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExcecuted = true;
                      });
                    });
                  });
            },
          ),
        ],
        title: TextField(
          style: TextStyle(color: kWhiteColor),
          decoration: InputDecoration(
              hintText: "Search Courses",
              hintStyle: TextStyle(
                color: kWhiteColor,
              )),
          controller: searchController,
        ),
      ),
      body: isExcecuted
          ? searchData()
          : Container(
        child: Center(
          child: Text("Search Any Course "),
        ),
      ),
    );
  }
}
