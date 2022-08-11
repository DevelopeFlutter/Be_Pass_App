// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:be_pass/Screens/chat_screen.dart';
import 'package:be_pass/Screens/home_screen.dart';
import 'package:be_pass/Screens/landingPageView.dart';
import 'package:be_pass/Screens/profile_screen.dart';
import 'package:be_pass/app_Colors.dart';
import 'package:flutter/material.dart';

import 'app_drawer.dart';
import 'user_card_widget.dart';

class BottomBar extends StatefulWidget {
  BottomBar();

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 1;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(false),
    LandingPageView(),
    ChatScreen(),
    Profile(),
    AppDrawer(true),
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
