import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Screens/Projects/project_detail.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/Projects/project_badge.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class ProjectCardVertical extends StatelessWidget {
  final String projectName;
  final String category;
  final int ratingsUpperNumber;
  final int ratingsLowerNumber;
  final String color;
  final Function() ?onTap; // أضف onTap
  final String image;
  const ProjectCardVertical({
    Key? key,
    required this.projectName,
    required this.category,
    required this.ratingsUpperNumber,
    required this.ratingsLowerNumber,
    required this.color,
    required this.image,
     this.onTap, // أضف onTap في المُنشئ
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // استخدم onTap هنا
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: HexColor.fromHex("20222A"), borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ColouredProjectBadge(color: color, category: category,image: image,),
          AppSpaces.verticalSpace20,
          Text(projectName, style: GoogleFonts.lato(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
          SizedBox(height: 5),
          Text(category, style: GoogleFonts.lato(color: HexColor.fromHex("626677"))),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor.fromHex("343840"),
                  ),
                  child: Row(children: [
                    Expanded(
                      flex: ratingsUpperNumber,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [darken(HexColor.fromHex(color)), HexColor.fromHex(color)],
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: ratingsLowerNumber, child: SizedBox())
                  ]),
                ),
              ),
              AppSpaces.horizontalSpace10,
              Text("$ratingsUpperNumber/$ratingsLowerNumber", style: GoogleFonts.lato(color: Colors.white)),
            ]),
          )
        ]),
      ),
    );
  }
}
