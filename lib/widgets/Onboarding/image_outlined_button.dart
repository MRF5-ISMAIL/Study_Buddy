import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Values/values.dart';

class OutlinedButtonWithImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final VoidCallback ?onPressed; // دالة يتم تنفيذها عند الضغط

  OutlinedButtonWithImage({
    Key? key,
    required this.imageUrl,
    this.width,
     this.onPressed, // تمرير الدالة في البناء
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed, // استخدام الدالة عند الضغط
        style: ButtonStyles.imageRounded,
        child: Center(
          child: Container(
            width: 30,
            height: 30,
            child: ClipOval(
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage(this.imageUrl),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
