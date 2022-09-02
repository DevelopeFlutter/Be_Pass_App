// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_field, sort_child_properties_last, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Widgets/custom_button_widget.dart';
import '../Widgets/text_widget.dart';
import '../app_Colors.dart';

class GenProfile extends StatefulWidget {
  static const routeName = "gen-profile";

  GenProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<GenProfile> createState() => _GenProfileState();
}

class _GenProfileState extends State<GenProfile> {
  TextEditingController _fname = TextEditingController();

  TextEditingController _lname = TextEditingController();

  TextEditingController _textEditingControllerPro = TextEditingController();

  TextEditingController _textEditingControllerSkill = TextEditingController();

  TextEditingController _dob = TextEditingController();

  TextEditingController _loc = TextEditingController();
  List<String> _valuesSkill = [];
  List<bool> _selectedSkill = [];
  List<String> _valuesPro = [];
  List<bool> _selectedPro = [];

  @override
  void dispose() {
    _fname.dispose();
    _lname.dispose();
    _loc.dispose();
    super.dispose();
  }

  Widget buildChipsPro() {
    List<Widget> chips = [];

    for (int i = 0; i < _valuesPro.length; i++) {
      InputChip actionChip = InputChip(
        selected: _selectedPro[i],
        label: Text(
          _valuesPro[i],
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
            _selectedPro[i] = !_selectedPro[i];
          });
        },
        onDeleted: () {
          _valuesPro.removeAt(i);
          _selectedPro.removeAt(i);

          setState(() {
            _valuesPro = _valuesPro;
            _selectedPro = _selectedPro;
          });
        },
      );

      chips.add(actionChip);
    }
    return GridView(
      // This next line does the trick.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          childAspectRatio: 2,
          crossAxisSpacing: 5,
          mainAxisExtent: 50),
      //scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  Widget buildChipsSkill() {
    List<Widget> chips = [];

    for (int i = 0; i < _valuesSkill.length; i++) {
      InputChip actionChip = InputChip(
        selected: _selectedSkill[i],
        label: Text(
          _valuesSkill[i],
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
            _selectedSkill[i] = !_selectedSkill[i];
          });
        },
        onDeleted: () {
          _valuesSkill.removeAt(i);
          _selectedSkill.removeAt(i);

          setState(() {
            _valuesSkill = _valuesSkill;
            _selectedSkill = _selectedSkill;
          });
        },
      );

      chips.add(actionChip);
    }
    return GridView(
      // This next line does the trick.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          childAspectRatio: 2,
          crossAxisSpacing: 5,
          mainAxisExtent: 50),
      //scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "About",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: AppColors.black, wordSpacing: 10, fontSize: 22),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return VxBox(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Container(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                backgroundColor: AppColors.red,
                                radius: 10.0,
                                child: Icon(
                                  Icons.close,
                                  size: 15.0,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/man.jpg"),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ).p(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Main Image",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  width: 95,
                                  height: 29.9,
                                  child: CustomButton(
                                      onTap: () {},
                                      borderRadius: 20,
                                      textColor: AppColors.white,
                                      buttonText: "Upload"),
                                ).pOnly(left: 70),
                              ],
                            ).pSymmetric(h: 10, v: 10),
                            Text(
                              "Allowed JPG,GIF,PNG, Max size of 800kb",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: AppColors.greyText, fontSize: 11),
                              ),
                            ).pOnly(left: 70),
                            Divider(
                              thickness: 2,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ).make();
                },
              ),
            ),
            Mytextwidget(
                labeltext: "First name",
                controller: _fname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.name,
                hintText: "first name"),
            Mytextwidget(
                labeltext: "last name",
                controller: _lname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.name,
                hintText: "last name"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Profession"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  controller: _textEditingControllerPro,
                  onEditingComplete: () {
                    _valuesPro.add(_textEditingControllerPro.text);
                    _selectedPro.add(true);
                    _textEditingControllerPro.clear();

                    setState(() {
                      _valuesPro = _valuesPro;
                      _selectedPro = _selectedPro;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: _valuesPro.isEmpty ? 5 : 100,
              child: buildChipsPro(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Skills"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        width: 1.0,
                      ),
                    ),
                  ),
                  controller: _textEditingControllerSkill,
                  onEditingComplete: () {
                    _valuesSkill.add(_textEditingControllerSkill.text);
                    _selectedSkill.add(true);
                    _textEditingControllerSkill.clear();

                    setState(() {
                      _valuesSkill = _valuesSkill;
                      _selectedSkill = _selectedSkill;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: _valuesSkill.isEmpty ? 5 : 100,
              child: buildChipsSkill(),
            ),
            Mytextwidget(
                labeltext: "Date of Birth",
                controller: _fname,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.datetime,
                hintText: "19/2/2000"),
            Mytextwidget(
                labeltext: "Your Location",
                controller: _fname,
                actionKeyboard: TextInputAction.done,
                onSubmitField: () {},
                textInputType: TextInputType.streetAddress,
                hintText: "City, town"),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 50,
              width: 150,
              child: CustomButton(
                  textColor: AppColors.white,
                  borderRadius: 20,
                  onTap: () {},
                  buttonText: "Save Changes"),
            )
          ],
        ),
      ),
    );
  }
}

//list view function
class Listitems extends StatelessWidget {
  final String imagesrc;
  final String titleel;
  const Listitems({
    Key? key,
    required this.imagesrc,
    required this.titleel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 60,
        width: 60,
        child: Container(
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: AppColors.red,
              radius: 10.0,
              child: Icon(
                Icons.close,
                size: 15.0,
                color: AppColors.white,
              ),
            ),
          ),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagesrc),
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
      title: Text(
        titleel,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ).pOnly(top: 10),
      subtitle: Text(
        "Allowed JPG,GIF,PNG, Max size of 800kb",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(color: AppColors.greyText, fontSize: 11),
        ),
      ).pOnly(top: 10),
      trailing: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 95,
          height: 29.9,
          child: CustomButton(
              onTap: () {},
              borderRadius: 20,
              textColor: AppColors.white,
              buttonText: "Upload"),
        ),
      ),
    );
  }
}

class dividefun extends StatelessWidget {
  const dividefun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
    ).pSymmetric(h: 20);
  }
}

class Newel extends StatelessWidget {
  final String imagesrc;
  final String titleel;
  const Newel({
    Key? key,
    required this.imagesrc,
    required this.titleel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Container(
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: AppColors.red,
                  radius: 10.0,
                  child: Icon(
                    Icons.close,
                    size: 15.0,
                    color: AppColors.white,
                  ),
                ),
              ),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagesrc),
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ).p(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    titleel,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 95,
                    height: 29.9,
                    child: CustomButton(
                        onTap: () {},
                        borderRadius: 20,
                        textColor: AppColors.white,
                        buttonText: "Upload"),
                  ).pOnly(left: 70),
                ],
              ).pSymmetric(h: 10, v: 10),
              Text(
                "Allowed JPG,GIF,PNG, Max size of 800kb",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: AppColors.greyText, fontSize: 11),
                ),
              ).pOnly(left: 70),
            ],
          ),
        ],
      ),
    ).make();
  }
}
