// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_import

import 'package:be_pass/app_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawer extends StatelessWidget {
  final String name;
  final bool userCheck;
  AppDrawer(this.name, this.userCheck);

  @override
  Widget build(BuildContext context) {
    if (userCheck) {
      return ListView(
        children: [
          Container(
              child: Column(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/user_icon.png",
                      height: 65,
                      width: 65,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text("Visit Profie")
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Account Setting"),
              ),
              ListTile(
                leading: Icon(Icons.star_rate_sharp),
                title: Text("Rate Our App"),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("Invite Your Friend"),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Contact Us"),
              ),
              ListTile(
                leading: Icon(Icons.web_rounded),
                title: Text("Website"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Sign Out"),
              ),
              TextButton(
                  onPressed: () {}, child: Text("Terms and Privacy Policy"))
            ],
          )),
        ],
      );
    } else {
      return ListView(
        children: [
          Container(
              child: Column(
            children: [
              DrawerHeader(
                child: Container(
                    height: 100,
                    width: 100,
                    child: SvgPicture.asset("assets/img.svg")),
              ),
              ListTile(
                leading: Icon(Icons.star_rate_sharp),
                title: Text("Rate Our App"),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("Invite Your Friend"),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Contact Us"),
              ),
              ListTile(
                leading: Icon(Icons.web_rounded),
                title: Text("Website"),
              ),
              ListTile(
                leading: Icon(Icons.handshake),
                title: Text("Join Us"),
              ),
              TextButton(
                  onPressed: () {}, child: Text("Terms and Privacy Policy"))
            ],
          )),
        ],
      );
    }
  }
}
