import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Home.dart';
import 'package:trainingtalenew/Screens/HomeScreen/Search.dart';

class DataController extends GetxController {

  Future getData(String collection) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async{
    return FirebaseFirestore.instance.collection("features").where('title',isGreaterThanOrEqualTo:
    queryString).get();
}


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
