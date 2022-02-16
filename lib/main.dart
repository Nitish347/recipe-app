import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:recipe_app/Home_Page.dart';
import 'package:recipe_app/login.dart';
import 'package:recipe_app/main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splashIconSize: 500,
          nextScreen: LoginPage(),
          backgroundColor: Colors.black,
          animationDuration: Duration(seconds: 1),
          splash: Container(

            child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                  ),
                  SizedBox(height:100,),
                  Expanded(child: Text("Made By: Nitish Chaurasiya",style: TextStyle(color: Colors.white,fontSize: 10),))

                ]),
          ),
        )
    );
  }
}

void main() {
  runApp(SplashScreen());
}
