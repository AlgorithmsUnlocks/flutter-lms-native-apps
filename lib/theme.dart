import 'package:flutter/material.dart';
import 'package:trainingtalenew/constants.dart';
import 'constants.dart';

ThemeData theme(){

  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: AppBarTheme(),
    textTheme: TextTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,

  );
}

InputDecorationTheme inputDecorationTheme(){
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: kPrimaryColor),
    gapPadding: 1,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    hoverColor: kPrimaryColor,
  );
}

TextTheme textTheme(){
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme(){
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(color: Color(0xFF8B8B8B),fontSize: 18),
      ),
    );
}