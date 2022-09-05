// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_Colors.dart';

class TrainerProfileCard extends StatelessWidget {
  const TrainerProfileCard({Key? key}) : super(key: key);
  chipList() {
    return ListView(
      children: <Widget>[
        _buildChip('Gamer', Color(0xFFff6666)),
        _buildChip('Hacker', Color(0xFF007f5c)),
        _buildChip('Developer', Color(0xFF5f65d3)),
        _buildChip('Racer', Color(0xFF19ca21)),
        _buildChip('Traveller', Color(0xFF60230b)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                    height: 70,
                    width: 70,
                    child: SvgPicture.asset(
                      "assets/user.svg",
                    )),
              ),
              Text(
                'Personal fitness trainer',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Lorem ipsum dolor sit amet, consectetur.",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My professional and Skills",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
              height: 70,
              child: Wrap(
                children: chipList(),
              )),
        ],
      ),
    );
  }
}

class customProfieWidget extends StatelessWidget {
  final String dataText;
  final String value;
  customProfieWidget({required this.dataText, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textBaseline: TextBaseline.ideographic,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Text(
            dataText,
            style: GoogleFonts.poppins(
                fontSize: 18,
                color: AppColors.gradientGreen,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              value,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w700),
            )),
      ],
    );
  }
}

Widget _buildChip(String label, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
    avatar: CircleAvatar(
      backgroundColor: Colors.white70,
      child: Text(label[0].toUpperCase()),
    ),
    label: Text(
      label,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(8.0),
  );
}
