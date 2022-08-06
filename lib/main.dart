import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:trainingtalenew/Screens/SigninOpton/HomeScreen.dart';
import 'package:trainingtalenew/Service/GoogleSignInProvider.dart';
import 'Screens/SplashScreen.dart';
import 'package:trainingtalenew/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {

  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create:(context) => GoogleSignInProvider(),
            child: HomeScreen(),
          ),
        ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Training Tale LMS',
      theme: theme(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: SplashScreen(),
    ));
  }
  void changedTheme(ThemeMode themeMode){
    setState(() {
      _themeMode = themeMode;
    });
  }
}
