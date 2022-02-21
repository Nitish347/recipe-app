import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'package:recipe_app/apiModel.dart';

import 'dart:io' show Platform;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;

  TextEditingController textEditingController = new TextEditingController();

  List<RecipeModel> recipes = new List<RecipeModel>();

  String appID = "cd6b7967";
  String appKey = "25cf044a32e47f4cf5ec9ec50171089a	";

  getRecipes(String query) async {
    if (query.isNotEmpty) {
      setState(() {
        _loading = true;
      });
      recipes = new List();
      String url =
          "https://api.edamam.com/search?q=$query&app_id=cd6b7967&app_key=25cf044a32e47f4cf5ec9ec50171089a	";
      var response = await http.get(Uri.parse(url));
      Map<String, dynamic> jsonData = json.decode(response.body);
      jsonData["hits"].forEach((element) {
        RecipeModel recipeModel = new RecipeModel();
        recipeModel = RecipeModel.fromMap(element["recipe"]);
        recipes.add(recipeModel);
      });
      setState(() {
        _loading = false;
      });
      print(recipes);
      print("doing it");
    } else {
      print("not doing it");
    }
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
        SingleChildScrollView(
          child: Container(
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
                    padding: EdgeInsets.only(left: 15, bottom: 5, right: 15),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                              ),
                              controller: textEditingController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Ingridient",
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green.withOpacity(0.8),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                getRecipes(textEditingController.text);
                                print(textEditingController.text);
                              } else {
                                print("yes");
                              }
                            },
                            child: Container(
                              // padding: EdgeInsets.all(0),
                              child: Icon(
                                CupertinoIcons.search,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                ),
                _loading
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/2,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                          backgroundColor: Colors.greenAccent,
                        ),
                      ),
                    ),

                  ],
                )
                    : Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          child: GridView(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 30.0,
                                      mainAxisSpacing: 30.0,
                                      maxCrossAxisExtent: 200.0),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: ClampingScrollPhysics(),
                              children: List.generate(recipes.length, (index) {
                                return GridTile(
                                    child: RecipeBox(
                                  title: recipes[index].label,
                                  imgUrl: recipes[index].image,
                                  desc: recipes[index].source,
                                  url: recipes[index].url,
                                ));
                              })),
                        ),
                      ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

void main() {
  runApp(HomePage());
}

class RecipeBox extends StatefulWidget {
  String title, desc, url, imgUrl;
  RecipeBox({this.title, this.desc, this.imgUrl, this.url});

  @override
  _RecipeBoxState createState() => _RecipeBoxState();
}

class _RecipeBoxState extends State<RecipeBox> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            print(widget.url + " this is what we are going to see");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipePage(
                          recipeUrl: widget.url,
                        )));
          },
          child: Container(
            // margin: EdgeInsets.only(left: 12,right: 12),

            child: Stack(children: [
              Container(
                child: Stack(
                  children: [
                    Image.network(
                      widget.imgUrl,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 200,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.green.withOpacity(.5),
                              Colors.greenAccent.withOpacity(.5)
                            ],
                                begin: FractionalOffset.centerRight,
                                end: FractionalOffset.centerLeft)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.title,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Overpass'),
                              ),
                              Text(
                                widget.desc,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black87,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class RecipePage extends StatefulWidget {
  final String recipeUrl;
  RecipePage({this.recipeUrl});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Recipe",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.recipeUrl,
        ),
      ),
    );
  }
}
