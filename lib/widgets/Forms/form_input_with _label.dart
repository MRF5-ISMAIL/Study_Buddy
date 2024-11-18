import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelledFormInput extends StatefulWidget {
  final String label;
  final String placeholder;
  final String? value;
  final String keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  const LabelledFormInput({
    Key? key,
    required this.placeholder,
    required this.keyboardType,
    required this.controller,
    required this.obscureText,
    required this.label,
    this.value,
  }) : super(key: key);

  @override
  _LabelledFormInputState createState() => _LabelledFormInputState();
}

class _LabelledFormInputState extends State<LabelledFormInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    bool isPasswordField = widget.placeholder == 'Password' ||
        widget.placeholder == 'Choose a password' ||
        widget.placeholder == 'Confirm Password';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label and Input Field
        TextFormField(
          controller: widget.controller,
          obscureText: isPasswordField ? _obscureText : false,
          keyboardType: widget.keyboardType == "text"
              ? TextInputType.text
              : TextInputType.number,
          style: GoogleFonts.lato(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          decoration: InputDecoration(
  labelText: widget.placeholder,
  labelStyle: GoogleFonts.lato(
    fontSize: 17,
    color: Colors.grey.shade500,
  ),
  filled: true,
  fillColor: HexColor.fromHex("#2C2F36"), // Background color
  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(
      color: HexColor.fromHex("#5D9EF6"),
      width: 2.0,
    ),
  ),
  suffixIcon: isPasswordField
      ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey.shade500,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
      : null,
),

        ),
      ],
    );
  }
}
