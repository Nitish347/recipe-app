import 'dart:ui';

import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/loginpage.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              )
      ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height/1.3,
                width: MediaQuery.of(context).size.width/1.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/15,
                    ),
                    Center(
                      child: Text("WELCOME",style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 40,fontWeight: FontWeight.bold,),),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Form(child:
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              hintStyle: TextStyle(
                                color: Colors.white30,

                              ),
                              labelText: "Name",
                                labelStyle: TextStyle(
                                    color: Colors.green,
                                  fontSize: 20
                                )
                            ),

                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/50,
                          ),
                          TextFormField(
                            decoration: InputDecoration(

                              hintText: "Enter Your Phone No.",
                              hintStyle: TextStyle(
                                  color: Colors.white30
                              ),
                              labelText: "Phone No.",
                              labelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 20
                              )
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height/15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green.withOpacity(0.6),
                            ),
                              height: MediaQuery.of(context).size.height/15,
                              width: MediaQuery.of(context).size.width/3,
                            child: Center(
                              child: Text("Log In",style: TextStyle(fontSize: 17),),
                            ),
                            ),

                        ],
                      )),
                    ),
                  ],
                ),
                
              ),
          ),
        ],
      ),
    );
  }
}
