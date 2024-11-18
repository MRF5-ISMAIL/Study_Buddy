import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Values/values.dart';

class MajorDropdown extends StatelessWidget {
  final String? selectedMajor;
  final ValueChanged<String?> onChanged;
  final List<String> majors;  // Property to receive the list of majors
  final String labelText;
  final String hint;
  MajorDropdown({
    required this.majors,       // List of majors
    this.selectedMajor, 
    required this.onChanged,
    required this.labelText,
    required this.hint
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: HexColor.fromHex("262A34"),  // Background color
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,  // Set text direction to Left-to-Right
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: const Color.fromARGB(255, 231, 235, 234),
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 87, 92, 92),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          hint: Text(hint,
            style: TextStyle(color: const Color.fromARGB(255, 231, 230, 230)),
          ),
          value: selectedMajor,
          onChanged: onChanged,
          items: majors.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,  // Align items to the left
                children: [
                  Icon(Icons.school, color: const Color.fromARGB(255, 248, 249, 249), size: 18.0),  // Icon next to the major
                  SizedBox(width: 8.0),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 249, 251, 251),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
