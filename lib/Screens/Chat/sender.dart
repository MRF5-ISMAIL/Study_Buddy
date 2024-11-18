import 'package:flutter/material.dart';

class PostBottomWidgetBot extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onSend;

  const PostBottomWidgetBot({
    Key? key,
    required this.label,
    required this.controller,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: label,
              filled: true,
              fillColor: Colors.white24,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.blueAccent),
          onPressed: onSend,
        ),
      ],
    );
  }
}
