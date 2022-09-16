// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_import

import 'dart:async';

import 'package:be_pass/Authentication/View/login_view.dart';
import 'package:be_pass/Authentication/View/sign_up_view.dart';
import 'package:be_pass/Widgets/category_dropdown.dart';
import 'package:be_pass/Widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Authentication/View/sign_up_view.dart';
import '../Widgets/bottom_nav.dart';
import '../app_Colors.dart';

class HomeScreen extends StatefulWidget {
  final bool userCheck;
  HomeScreen(this.userCheck);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? debounce;
  DetailsResult? position;
  late FocusNode locFocusNode;
  TextEditingController loc = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String apikey = "AIzaSyCkmpaMPmzhJgTLPh2r_14RB4Je-tX76lw";
    googlePlace = GooglePlace(apikey);
    locFocusNode = FocusNode();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  void dispose() {
    locFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return widget.userCheck
        ? SafeArea(
            child: Scaffold(
              //bottomNavigationBar: BottomBar(),
              backgroundColor: Color.fromARGB(255, 232, 232, 232),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height / 2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(89, 223, 86, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: CircleAvatar(
                                    radius: 18,
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Color.fromRGBO(89, 223, 86, 1),
                                    child: Text("en"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Text(
                            "Find Professionals",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "That Be-Pass tailors especially for you",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Catbut(),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 55),
                            child: TextFormField(
                              onChanged: (value) {
                                if (debounce?.isActive ?? false)
                                  debounce!.cancel();
                                debounce =
                                    Timer(Duration(milliseconds: 100), () {
                                  if (value.isNotEmpty) {
                                    //call place api
                                    autoCompleteSearch(value);
                                  } else {
                                    //shutup
                                    setState(() {
                                      predictions = [];
                                      position = null;
                                    });
                                  }
                                });
                              },
                              style: TextStyle(color: Colors.white),
                              focusNode: locFocusNode,
                              controller: loc,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.pin_drop_outlined,
                                    color: Colors.white),
                                suffixIcon: loc.text.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.clear_outlined,
                                            color: Colors.white),
                                        onPressed: () {
                                          predictions = [];
                                          loc.clear();
                                        },
                                      )
                                    : null,
                                hintText: "Search Places",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fillColor: Color(0xff2DC52A),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Color(0xff2DC52A),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Color(0xff2DC52A),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: predictions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              onTap: () async {
                                final placeId =
                                    predictions[index].placeId!.toString();
                                final details =
                                    await googlePlace.details.get(placeId);
                                if (details != null &&
                                    details.result != null &&
                                    mounted) {
                                  if (locFocusNode.hasFocus) {
                                    setState(() {
                                      position = details.result;
                                      loc.text =
                                          details.result!.name.toString();
                                      predictions = [];
                                    });
                                  }
                                }
                              },
                              leading: CircleAvatar(
                                  backgroundColor: AppColors.gradientGreen,
                                  child: Icon(Icons.pin_drop,
                                      color: Colors.white)),
                              title: Text(
                                  predictions[index].description.toString()));
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 50,
                        width: 312,
                        decoration: BoxDecoration(
                            color: Color(0xff59DF56),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Find Professinals",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 10,
                    ),
                  ],
                ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              //bottomNavigationBar: BottomBar(),
              backgroundColor: Color.fromARGB(255, 232, 232, 232),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    VxArc(
                      arcType: VxArcType.CONVEX,
                      height: 50,
                      edge: VxEdge.BOTTOM,
                      child: Container(
                        height: 400,
                        width: double.infinity,
                        color: Color.fromRGBO(89, 223, 86, 1),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 18,
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Color.fromRGBO(89, 223, 86, 1),
                                      child: Text("en"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Text(
                              "Find Professionals",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "That Be-Pass tailors especially for you",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Catbut(),
                            SizedBox(
                              height: 20,
                            ),
                            Countbut(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 6.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          height: 50,
                          width: 312,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(89, 223, 86, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context)
                                //     .pushNamed(SearchingScreen.routeName);
                              },
                              child: Text(
                                "Find Professinals",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpView());
                      },
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(89, 223, 86, 1),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginView());
                      },
                      child: RichText(
                        text: TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Log in',
                                style: TextStyle(
                                    color: Color.fromRGBO(89, 223, 86, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
