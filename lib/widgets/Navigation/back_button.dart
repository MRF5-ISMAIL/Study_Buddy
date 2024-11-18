import 'package:flutter/material.dart';
import 'package:flutter_application_chat/widgets/Shapes/roundedborder_with_icon.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: RoundedBorderWithIcon(icon: Icons.arrow_back),
    );
  }
}
