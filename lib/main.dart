
import 'package:flutter/material.dart';
import 'package:hatch_box/intro.dart';
import 'package:hatch_box/login.dart';
import 'package:hatch_box/splash.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore_for_file: prefer_const_constructors

Future main() async {
  WidgetsFlutterBinding.ensureInitialized ();
  await Firebase.initializeApp();
  //FlutterNativeSplash.removeAfter(initialization);
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyLogin(),
      ),
    );
  }
}


