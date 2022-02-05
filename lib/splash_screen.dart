import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:recipe_app/login.dart';
import 'package:recipe_app/main.dart';

class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      AnimatedSplashScreen(
          splashIconSize: 300,
          nextScreen: LoginPage(),
          backgroundColor: Colors.black,

          animationDuration:Duration(seconds: 2),
          splash:Container(
            child: Image.asset("assets/logo.png",),
          )
      ),
    );
  }
}
void main(){
  runApp(SplashScreen());
}
