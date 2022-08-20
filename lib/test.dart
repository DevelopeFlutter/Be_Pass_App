// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';

class TestFile extends StatefulWidget {
  TestFile({Key? key}) : super(key: key);

  @override
  State<TestFile> createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {
  List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card());
    });
  }

  void _removeCardWidget() {
    setState(() {
      if (_cardList.isNotEmpty) {
        _cardList.removeLast();
      }
      print(_cardList.length);
    });
  }

  Widget _card() {
    return Container(
        height: 80,
        margin: EdgeInsets.only(top: 5, left: 8, right: 8),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.orangeAccent[100],
        ),
        child: Center(
            child: Column(
          children: [
            Row(children: [
              IconButton(icon: Icon(Icons.cancel), onPressed: _removeCardWidget)
            ])
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _addCardWidget,
          tooltip: 'Add',
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: _cardList.length,
            itemBuilder: (context, index) {
              return _cardList[index];
            }));
  }
}



















































// import 'package:flutter/material.dart';

// class TestFile extends StatefulWidget {
//   const TestFile(this.title);

//   final String title;

//   @override
//   _TestFileState createState() => _TestFileState();
// }

// int num = 5;

// class _TestFileState extends State<TestFile> {
//   final List<_HomeItem> items = List.generate(
//     num,
//     (i) => _HomeItem(
//         i,
//         'Tile n°$i',
//         IconButton(
//           icon: Icon(Icons.cancel),
//           onPressed: () {},
//         )),
//     growable: true,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 setState(() {
//                   num = num + 1;
//                   TestFile("hi");
//                 });
//                 print(num);
//               })
//         ],
//       ),
//       body: Center(
//         child: _buildList(context),
//       ),
//     );
//   }

//   Widget _buildList(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return Tile(items[index], _deleteItem);
//       },
//       itemCount: items.length,
//     );
//   }

//   void _deleteItem(_HomeItem item) {
//     setState(() {
//       print(context);
//       print("remove: $item");
//       print("Number of items before: ${items.length}");
//       items.remove(item);
//       print("Number of items after delete: ${items.length}");
//     });
//   }
// }

// class Tile extends StatefulWidget {
//   final _HomeItem item;
//   final Function delete;

//   Tile(this.item, this.delete);

//   @override
//   State<StatefulWidget> createState() => _TileState(item, delete);
// }

// class _TileState extends State<Tile> {
//   final _HomeItem item;
//   final Function delete;

//   _TileState(this.item, this.delete);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         key: ValueKey(item.index),
//         title: Text("${item.title}"),
//         subtitle: Text("${item.index}"),
//         trailing: IconButton(
//           icon: Icon(Icons.cancel),
//           onPressed: () => delete(item),
//         ));
//   }
// }

// class _HomeItem {
//   const _HomeItem(this.index, this.title, this.iconButton);

//   final int index;
//   final String title;
//   final IconButton iconButton;
// } 





































// // ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names, unused_import, prefer_const_constructors, unused_element, prefer_interpolation_to_compose_strings

// import 'package:flutter/material.dart';

// class TestFile extends StatefulWidget {
//   const TestFile({Key? key}) : super(key: key);

//   @override
//   State<TestFile> createState() => _TestFileState();
// }

// class _TestFileState extends State<TestFile> {
//   @override
//   Widget build(BuildContext context) {
//     late List<Widget> ColWidget;
//     void removeItem() {
//       if (ColWidget.isNotEmpty) {
//         ColWidget.removeLast();
//         print("this is " + ColWidget.length.toString());
//       }
//     }

//     ColWidget = [
//       CustomWidgetItem(removeItem),
//       CustomWidgetItem(removeItem),
//       CustomWidgetItem(removeItem)
//     ];

//     void addItem() {
//       ColWidget.add(CustomWidgetItem(removeItem));
//       print("this is " + ColWidget.length.toString());
//     }

//     return Scaffold(
//         body: Column(
//       children: [
//         Expanded(
//             child: ListView.builder(
//           itemBuilder: (ctx, i) => ColWidget[i],
//           itemCount: ColWidget.length,
//         )),
//         GestureDetector(
//             onTap: addItem,
//             child: Row(
//               children: [
//                 Text("Add Item"),
//                 Icon(Icons.add),
//               ],
//             ))
//       ],
//     ));
//   }
// }

// class CustomWidgetItem extends StatelessWidget {
//   final Function removeItem;
//   const CustomWidgetItem(this.removeItem);
//   @override
//   Widget build(BuildContext context) {
//     return rowMethod();
//   }

//   Row rowMethod() {
//     return Row(
//       children: [
//         TextFormField(),
//         TextFormField(),
//         IconButton(icon: Icon(Icons.cancel), onPressed: removeItem())
//       ],
//     );
//   }
// }
