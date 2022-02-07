import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:recipe_app/Home_Page.dart';
import 'package:recipe_app/otp_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
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
                  image: AssetImage('assets/home.jpg'),
                  fit: BoxFit.cover
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              )
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.25,
                width: MediaQuery.of(context).size.width / 1.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height /35,
                    ),
                    Center(
                      child: Column(children: [
                        Text(
                          "WELCOME ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30,right: 30),
                          child: Text(
                            "$name",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                                fontFamily: "cursive"
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Center(


                      child: Container(

                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                              child: Column(
                            children: [
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                decoration: InputDecoration(
                                    hintText: "Enter Your Name",
                                    hintStyle: TextStyle(
                                      color: Colors.white30,
                                    ),
                                    labelText: "Name",
                                    labelStyle: TextStyle(
                                        color: Colors.green, fontSize: 20),),
                                onChanged: (value) {
                                  name = value;
                                  setState(() {});
                                },
                                validator: (value) {
                                  if(value==null || value.isEmpty){
                                    return "Enter Your Name!!!";
                                  }
                                  else if(value.length > 20){
                                    return "Name must be less than 20 letters!!!";

                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                decoration: InputDecoration(
                                    hintText: "Enter Your Phone No.",
                                    hintStyle: TextStyle(color: Colors.white30),
                                    labelText: "Phone No.",
                                    labelStyle: TextStyle(
                                        color: Colors.green, fontSize: 20)),
                                validator: (value) {
                                  if(value==null || value.isEmpty){
                                    return "Enter Your Phone Number!!!";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 12,
                              ),
                              InkWell(
                                onTap: () {
                                  if(_formKey.currentState.validate()){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage() ));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green.withOpacity(1),
                                  ),
                                  height: MediaQuery.of(context).size.height / 15,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Center(
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

