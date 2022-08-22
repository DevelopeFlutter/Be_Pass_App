// ignore_for_file: prefer_const_constructors

import 'package:be_pass/Widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import '../app_Colors.dart';

class WorkingAreas extends StatefulWidget {
  static const routeName = "working-areas";
  const WorkingAreas({Key? key}) : super(key: key);

  @override
  State<WorkingAreas> createState() => _WorkingAreasState();
}

class _WorkingAreasState extends State<WorkingAreas> {
  TextEditingController _textEditingController = new TextEditingController();
  TextEditingController _textArea = new TextEditingController();
  List<String> _values = [];
  List<bool> _selected = [];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _values.length; i++) {
      InputChip actionChip = InputChip(
        selected: _selected[i],
        label: Text(
          _values[i],
          style: TextStyle(
              color: AppColors.gradientGreen,
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
        selectedColor: Color.fromARGB(83, 78, 228, 64),
        deleteIconColor: AppColors.gradientGreen,
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.teal,
        onPressed: () {
          setState(() {
            _selected[i] = !_selected[i];
          });
        },
        onDeleted: () {
          _values.removeAt(i);
          _selected.removeAt(i);

          setState(() {
            _values = _values;
            _selected = _selected;
          });
        },
      );

      chips.add(actionChip);
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        Text("Add Working Areas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("I work in city"),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            label: Text("Working Areas"),
                            hintText: "New York, Seattle ",
                            fillColor: Colors.white,
                            focusColor: AppColors.black,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: AppColors.greyText,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: AppColors.greyText,
                                width: 1.0,
                              ),
                            ),
                          ),
                          controller: _textEditingController,
                          onEditingComplete: () {
                            _values.add(_textEditingController.text);
                            _selected.add(true);
                            _textEditingController.clear();

                            setState(() {
                              _values = _values;
                              _selected = _selected;
                            });
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 30,
                          child: buildChips(),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Work in Areas"),
                        TextFormField(
                          minLines: 2,
                          maxLines: 5,
                          textInputAction: TextInputAction.send,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            label: Text("Introduce Yourself"),
                            hintText:
                                'Experienced web developer with a strong background in developing award-winning applications for a diverse clientele. 5+ years of industry',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {},
                buttonText: "Save Changes",
                borderRadius: 25,
                borderColor: Color.fromARGB(255, 232, 232, 232),
                textColor: Colors.white,
              )
            ],
          )),
    );
  }
}
