import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Values/values.dart';

class BottomSheetHolder extends StatelessWidget {
  const BottomSheetHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: HexColor.fromHex("5E6272")));
  }
}
