import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/apiModel.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController textEditingController = new TextEditingController();

  List<RecipeModel> recipes = new List<RecipeModel>();

  String appID = "cd6b7967";
  String appKey = "bb5fb885a939868aa526e8a593a4d86b";

  getRecipes(String query) async {
    String url = "https://api.edamam.com/search?q=$query&app_id=cd6b7967&app_key=bb5fb885a939868aa526e8a593a4d86b";
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = json.decode(response.body);
    jsonData["hits"].forEach((element){
    RecipeModel recipeModel =  new RecipeModel();
    recipeModel =RecipeModel.fromMap(element["recipe"]);
    recipes.add(recipeModel);
    });
    print(recipes);

  }

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
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff213A50).withOpacity(0.9),
                  Color(0xff071930).withOpacity(0.95)
                ])),
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Text(
                "ZAIKA",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: MediaQuery.of(context).size.height / 12,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "The Taste Of India",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: MediaQuery.of(context).size.height / 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "cursive"),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.11,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: EdgeInsets.only(left: 15,bottom: 5,right: 15),
                  child: Container(
                    
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(

                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                            controller : textEditingController ,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                                hintText: "Enter Ingridient",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green.withOpacity(0.8),
                                )
                            ),

                          ),
                        ),
                        SizedBox(width: 5,),
                        InkWell(
                          onTap: (){
                            if (textEditingController.text.isNotEmpty){
                              getRecipes(textEditingController.text);
                              print(textEditingController.text);
                            }
                            else{
                              print("yes");
                            }
                          },
                          child: Container(
                            // padding: EdgeInsets.all(0),
                            child: Icon(CupertinoIcons.search,color: Colors.green,size: 30,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
              ),

              // Text("ZAIKA",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height/12,fontWeight: FontWeight.bold),),
            ],
          ),
        )
      ],
    ));
  }
}

void main() {
  runApp(HomePage());
}
