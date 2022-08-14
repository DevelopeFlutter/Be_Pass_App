// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names, unused_import, prefer_const_constructors, unused_element, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class TestFile extends StatefulWidget {
  const TestFile({Key? key}) : super(key: key);

  @override
  State<TestFile> createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {
  @override
  Widget build(BuildContext context) {
    late List<Widget> ColWidget;
    void removeItem() {
      if (ColWidget.isNotEmpty) {
        ColWidget.removeLast();
        print("this is " + ColWidget.length.toString());
      }
    }

    ColWidget = [
      CustomWidgetItem(removeItem),
      CustomWidgetItem(removeItem),
      CustomWidgetItem(removeItem)
    ];

    void addItem() {
      ColWidget.add(CustomWidgetItem(removeItem));
      print("this is " + ColWidget.length.toString());
    }

    return Scaffold(
        body: Column(children: [
      Column(children: ColWidget),
      GestureDetector(
          onTap: addItem,
          child: Row(
            children: [Text("AddItem"), Icon(Icons.add)],
          )),
    ]));
  }
}

class CustomWidgetItem extends StatelessWidget {
  final Function removeItem;
  const CustomWidgetItem(this.removeItem);
  @override
  Widget build(BuildContext context) {
    return rowMethod();
  }

  Row rowMethod() {
    return Row(
      children: [
        TextFormField(),
        TextFormField(),
        IconButton(icon: Icon(Icons.cancel), onPressed: removeItem())
      ],
    );
  }
}
