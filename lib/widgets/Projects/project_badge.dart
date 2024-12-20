import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Values/values.dart';

class ColouredProjectBadge extends StatelessWidget {
  const ColouredProjectBadge({
    Key? key,
    required this.color,
    required this.category,
    required this.image
  }) : super(key: key);

  final String color;
  final String category;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: HexColor.fromHex(color)),
        ),
        child: Image.asset(image,
            color: (category == "Development" ? Colors.black : Colors.white)));
  }
}
