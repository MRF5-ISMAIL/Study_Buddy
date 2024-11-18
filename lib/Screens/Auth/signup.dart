import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Screens/Auth/login__.dart';
import 'package:flutter_application_chat/Screens/Auth/signup_page2.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:flutter_application_chat/widgets/Forms/form_input_with%20_label.dart';
// import 'package:flutter_application_chat/widgets/Forms/form_input_with_label.dart';
import 'package:flutter_application_chat/widgets/Forms/selection.dart';
import 'package:flutter_application_chat/widgets/Navigation/back.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  final String email;
  const SignUp({required this.email});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();  // Controller for email
  TextEditingController _confirmPassController = TextEditingController();  // Controller for confirming password
  bool obscureText = true;
  bool isAgreed = false;  // To track if the user agreed to the terms
  List<String> customMajors = [
    'Computer Science',
    'Civil Engineering',
    'Business Administration',
    'Medicine',
    'Law',
  ];
  String? selectedMajor;
  String? selectedRole;
  List<String> roles = ['Student', 'Assistant'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,  // Adjust the layout when the keyboard appears
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavigationBack(),
                    SizedBox(height: 40),
                    Text('Sign Up', style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                    AppSpaces.verticalSpace20,
                    RichText(
                      text: TextSpan(
                        text: 'Using  ',
                        style: GoogleFonts.lato(color: HexColor.fromHex("676979")),
                        children: <TextSpan>[
                          TextSpan(text: widget.email, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                          TextSpan(text: " to Sign Up.", style: GoogleFonts.lato(color: HexColor.fromHex("676979"))),
                        ],
                      ),
                    ),
                      SizedBox(height: 20),
                    LabelledFormInput(
                      placeholder: "Name",
                      keyboardType: "text",
                      controller: _nameController,
                      obscureText: obscureText,
                      label: "Your Name", 
                    ),
                    // SizedBox(height: 30),
                    // LabelledFormInput(
                    //   placeholder: "Email",
                    //   keyboardType: "email",
                    //   controller: _emailController,
                    //   obscureText: false,
                    //   label: "Your Email", 
                    // ),
                  
                    SizedBox(height: 40),
                    Center(
                      child: MajorDropdown(
                        labelText: 'Choose your specialty',
                        hint: 'Choose your specialty',
                        majors: customMajors, // Send the majors here
                        selectedMajor: selectedMajor,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMajor = newValue;
                          });
                        },
                      ),
                    ),
                   SizedBox(height: 40),
                    Center(
                      child: MajorDropdown(
                        labelText: 'Role',
                        hint: 'Student',
                        majors: roles, // Send the majors here
                        selectedMajor: selectedRole,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRole = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                            Get.to(() => SignUpPage2(email: '',major: '',name: 'l',));
                          
                        },
                        style: ButtonStyles.blueRounded,
                        child: Text('Next ', style: GoogleFonts.lato(fontSize: 20, color: Colors.white)),
                      ),
                     ),
               
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
