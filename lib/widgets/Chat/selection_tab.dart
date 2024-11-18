import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/Shapes/dashed_circle.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class SelectionTab extends StatelessWidget {
  final String title;
  final StatelessWidget? page;
  const SelectionTab({Key? key, required this.title, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title,
              style: GoogleFonts.lato(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: HexColor.fromHex("616575"),
              )),
          InkWell(
            onTap: () {
              Get.to(() => page!);
            },
            child: CircularBorder(
                color: HexColor.fromHex("616575"),
                width: 1,
                size: 20,
                icon: Icon(Icons.add, size: 15, color: HexColor.fromHex("616575"))),
          ),
        ]),
        AppSpaces.verticalSpace20,
        Divider(
          height: 2,
          color: HexColor.fromHex("616575"),
        ),
      ]),
    );
  }
}
