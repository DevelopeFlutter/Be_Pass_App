// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:be_pass/Screens/chat_screen.dart';
import 'package:be_pass/Screens/home_screen.dart';
import 'package:be_pass/Screens/landingPageView.dart';
import 'package:be_pass/Screens/profile_screen.dart';
import 'package:be_pass/app_Colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app_drawer.dart';
import 'category_dropdown.dart';
import 'country_dropdown.dart';
import 'user_card_widget.dart';

class BottomBar extends StatefulWidget {
  BottomBar();

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(false),
    LandingPageView(false),
    ChatScreen(),
    Profile(false),
    AppDrawer(false),
  ];

  final List appbarText = [
    Text("usercard", textAlign: TextAlign.center),
    Text("usercard1", textAlign: TextAlign.center),
    Text("usercard2", textAlign: TextAlign.center),
    Text("usercard3", textAlign: TextAlign.center),
    Text("Menu", textAlign: TextAlign.center),
  ];
  final List stringText = ["usercard", "usercard1", "usercard2", "Menu"];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: appbarText.elementAt(_selectedIndex),
      //   backgroundColor: appbarText.elementAt(_selectedIndex) == "Menu"
      //       ? Colors.grey
      //       : Colors.white,
      //   elevation: 0,
      // ),
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.web_asset),
              label: 'B-Card',
              backgroundColor: Color.fromARGB(255, 13, 227, 10),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 13, 227, 10),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_rounded),
              label: 'Menu',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.gradientGreen,
          selectedIconTheme: null,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 0),
    );
  }
}

class UC extends StatelessWidget {
  const UC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      UserCardWidget("assets/man.jpg", "Abdullah Ayaz",
          "Trainer, Nutritionist, Consultant", "Lahore, Pakistan", 3, 14, 10),
    ]);
  }
}

class Home extends StatelessWidget {
  final bool userCheck;
  const Home(this.userCheck);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            VxArc(
              arcType: VxArcType.CONVEX,
              height: 50,
              edge: VxEdge.BOTTOM,
              child: Container(
                height: 400,
                width: double.infinity,
                color: Color(0xff59DF56),
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
                              backgroundColor: Color(0xff59DF56),
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
                      "Work Simply ",
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                    Text(
                      "Thanks to Be-Pass ",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
            GestureDetector(
              onTap: () {},
              child: Text(
                "Create an account",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff59DF56),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: RichText(
                text: TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Log in',
                        style: TextStyle(
                            color: Color(0xff59DF56),
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
    );
  }
}
