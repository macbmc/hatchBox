import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Center(
      child: Container(
        child: Image.asset("assets/—Pngtree—cute panda_643086.png")
      ),
    ),
        backgroundColor: Colors.white,
        nextScreen: const HomeP()
    );
  }
}
