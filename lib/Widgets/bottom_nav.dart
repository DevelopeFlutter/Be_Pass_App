// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, unused_import, must_be_immutable, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';

import '../app_Colors.dart';

class BottomBar extends StatefulWidget {
  static const routeName = "/bottom-bar";
  int currentIndex;

  BottomBar(this.currentIndex);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      width: size.width,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.apps_sharp,
                        color: widget.currentIndex == 0
                            ? AppColors.gradientGreen
                            : Color.fromRGBO(117, 127, 140, 1),
                      ),
                      onPressed: () {
                        print(widget.currentIndex.toString());
                      },
                      splashColor: Colors.white,
                    ),
                    Text("Activity",
                        style: TextStyle(
                          color: widget.currentIndex == 0
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ))
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.games,
                          color: widget.currentIndex == 1
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ),
                        onPressed: () {
                          print(widget.currentIndex.toString());
                        }),
                    Text("Games",
                        style: TextStyle(
                          color: widget.currentIndex == 1
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ))
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.message,
                          color: widget.currentIndex == 2
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ),
                        onPressed: () {
                          print(widget.currentIndex.toString());
                        }),
                    Text("Chat",
                        style: TextStyle(
                          color: widget.currentIndex == 2
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ))
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.person,
                          color: widget.currentIndex == 3
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ),
                        onPressed: () {
                          print(widget.currentIndex.toString());
                        }),
                    Text("Profile",
                        style: TextStyle(
                          color: widget.currentIndex == 3
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ))
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.message,
                          color: widget.currentIndex == 4
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ),
                        onPressed: () {
                          print(widget.currentIndex.toString());
                        }),
                    Text("Chat",
                        style: TextStyle(
                          color: widget.currentIndex == 4
                              ? AppColors.gradientGreen
                              : Color.fromRGBO(117, 127, 140, 1),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
