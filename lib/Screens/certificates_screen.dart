// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:be_pass/app_Colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/custom_button_widget.dart';
import '../Widgets/image_select.dart';
import '../Widgets/text_widget.dart';

class CertificatesScreen extends StatefulWidget {
  static const routeName = "certificate-screen";
  CertificatesScreen({Key? key}) : super(key: key);

  @override
  State<CertificatesScreen> createState() => _CertificatesScreenState();
}

TextEditingController _org = TextEditingController();
TextEditingController _Cnam = TextEditingController();

class _CertificatesScreenState extends State<CertificatesScreen> {
  List<Widget> certificateList = [];
  void _addCard() {
    setState(() {
      certificateList.add(certificateCard(context, _removeCard));
    });
  }

  void _removeCard() {
    setState(() {
      if (certificateList.isNotEmpty) {
        certificateList.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            //CertNotify(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        Text("Add Certificates",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.3,
              width: double.infinity,
              child: certificateList.isEmpty
                  ? Center(
                      child: Text("No Certificates !",
                          style: TextStyle(fontSize: 20)))
                  : ListView.builder(
                      itemCount: 1 + certificateList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return certificateCard(context, _removeCard);
                      },
                    ),
            ),
            InkWell(
              splashColor: AppColors.gradientGreen,
              onTap: _addCard,
              child: DottedBorder(
                dashPattern: [6, 3, 2, 3],
                color: AppColors.gradientGreen,
                strokeWidth: 2,
                child: Container(
                    width: size.width / 1.5,
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add Certificate",
                            style: TextStyle(
                                color: AppColors.gradientGreen, fontSize: 16)),
                        Icon(Icons.add, color: AppColors.gradientGreen)
                      ],
                    )),
              ),
            ),

            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 148,
              child: CustomButton(
                      textColor: AppColors.white,
                      borderRadius: 16,
                      onTap: () {},
                      buttonText: "Save Changes")
                  .pSymmetric(),
            )
          ],
        ),
      ),
    ));
  }
}

Column certificateCard(BuildContext context, void Function() remove) {
  return Column(
    children: [
      // main container
      Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.greyText,
            ),
            borderRadius: BorderRadius.circular(10)),
        height: MediaQuery.of(context).size.height / 1.5,
        width: 328,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Certificates",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: AppColors.greyText,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ).pOnly(top: 20, left: 10),
            // inside main container where image and drop button placed
            Container(
              height: 111,
              width: 303,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyText,
                ),
              ),
              child: Row(
                children: [
                  //image picler container
                  Container(
                    height: 99,
                    width: 93,
                    child: ImageSel(),
                  ).p(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Experience",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.greyText,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ).pOnly(top: 23, left: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Years",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: AppColors.greyText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ).pOnly(left: 30, top: 10),
                          DroButton().pOnly(left: 10)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ).pOnly(left: 9, right: 12, top: 9, bottom: 5),
            Mytextwidget(
                labeltext: "Certifiacte name",
                controller: _Cnam,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.text,
                hintText: "City, town"),
            Mytextwidget(
                labeltext: "Organization",
                controller: _org,
                actionKeyboard: TextInputAction.next,
                onSubmitField: () {},
                textInputType: TextInputType.text,
                hintText: "City, town"),
            TextFormField(
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: AppColors.greyText,
                    width: 1.0,
                  ),
                ),
              ),
            ).p(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: remove,
                  child: Text("Delete Certificate",
                      style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: AppColors.red, fontSize: 16),
                      )).pOnly(right: 8),
                )
              ],
            )
          ],
        ),
      ).pOnly(top: 12),
      SizedBox(height: 20)
    ],
  );
}
// class listcertificates extends StatelessWidget {
//   const listcertificates({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height / 1.3,
//       width: double.infinity,
//       child: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (BuildContext context, int index) {
//           return certificateCard(context);
//         },
//       ),
//     );
//   }

class DroButton extends StatefulWidget {
  DroButton({Key? key}) : super(key: key);

  @override
  State<DroButton> createState() => _DroButtonState();
}

class _DroButtonState extends State<DroButton> {
  String dropdownvalue = '0';

  var items = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // Initial Value
      value: dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
