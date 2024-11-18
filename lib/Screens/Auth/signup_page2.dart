import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Screens/Auth/PrivacyPolicyPage.dart';
import 'package:flutter_application_chat/Screens/Auth/login__.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:flutter_application_chat/widgets/Forms/form_input_with%20_label.dart';
import 'package:flutter_application_chat/widgets/Navigation/back.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_application_chat/widgets/Forms/form_input_with_label.dart';

class SignUpPage2 extends StatefulWidget {
  final String email;
  final String name;
  final String major;

  const SignUpPage2({required this.email, required this.name, required this.major});

  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  bool obscureText = true;
  bool isAgreed = false;  // متغير للتحقق من الموافقة على الشروط
  // String? selectedRole;
  // List<String> roles = ['Student', 'Assistant'];
  TextEditingController _emailController = TextEditingController();  // Controller for email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          DarkRadialBackground(color: HexColor.fromHex("#181a1f"), position: "topLeft"),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavigationBack(),

                    SizedBox(height: 40),
                    Text('Complete Sign Up', style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                    AppSpaces.verticalSpace20,
                    RichText(
                      text: TextSpan(
                        text: 'Using  ',
                        style: GoogleFonts.lato(color: HexColor.fromHex("676979")),
                        children: <TextSpan>[
                          TextSpan(text: widget.email, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                          TextSpan(text: " to complete your registration.", style: GoogleFonts.lato(color: HexColor.fromHex("676979"))),
                        ],
                      ),
                    ),
                    // SizedBox(height: 30),
                      SizedBox(height: 30),
                    LabelledFormInput(
                      placeholder: "Email",
                      keyboardType: "email",
                      controller: _emailController,
                      obscureText: false,
                      label: "Your Email", 
                    ),
                                        SizedBox(height: 30),

                    LabelledFormInput(
                      placeholder: "Password",
                      keyboardType: "text",
                      controller: _passController,
                      obscureText: obscureText,
                      label: "Your Password",
                    ),
                    SizedBox(height: 20),
                    LabelledFormInput(
                      placeholder: "Confirm Password",
                      keyboardType: "text",
                      controller: _confirmPassController,
                      obscureText: obscureText,
                      label: "Confirm Your Password",
                    ),
                    // SizedBox(height: 40),
                    // Center(
                    //   child: MajorDropdown(
                    //     labelText: 'Role',
                    //     hint: 'Student',
                    //     majors: roles, // Send the majors here
                    //     selectedMajor: selectedRole,
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         selectedRole = newValue;
                    //       });
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed,
                          onChanged: (bool? value) {
                            setState(() {
                              isAgreed = value ?? false;
                            });
                          },
                        ),
                        InkWell(child:
                        Expanded(
                          child: Text(
                            'I agree to the terms and conditions',
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                        ),onTap: (){
                           Get.to(() => PrivacyPolicyPage());

                          
                        },
                        )
                      ],
                    ),

                    // SizedBox(height: 20),
                    // // Dropdown لاختيار الطالب أم المساعد
                    // Center(
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 2.0),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       color: HexColor.fromHex("262A34"),
                    //     ),
                    //     child: Directionality(
                    //       textDirection: TextDirection.ltr,
                    //       child: DropdownButtonFormField<String>(
                    //         decoration: InputDecoration(
                    //           labelText: 'Choose your role',
                    //           labelStyle: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 16.0,
                    //           ),
                    //           contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
                    //           border: OutlineInputBorder(
                    //             borderSide: BorderSide(
                    //               color: Colors.white,
                    //               width: 2.0,
                    //             ),
                    //             borderRadius: BorderRadius.circular(12.0),
                    //           ),
                    //         ),
                    //         hint: Text(
                    //           'Select role',
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //         value: selectedRole,
                    //         onChanged: (String? newValue) {
                    //           setState(() {
                    //             selectedRole = newValue;
                    //           });
                    //         },
                    //         items: roles.map<DropdownMenuItem<String>>((String value) {
                    //           return DropdownMenuItem<String>(
                    //             value: value,
                    //             child: Row(
                    //               children: [
                    //                 Icon(Icons.person, color: Colors.white, size: 18.0),
                    //                 SizedBox(width: 8.0),
                    //                 Text(
                    //                   value,
                    //                   style: TextStyle(
                    //                     fontSize: 16.0,
                    //                     fontWeight: FontWeight.w500,
                    //                     color: Colors.white,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          // if (_passController.text == _confirmPassController.text && isAgreed && selectedRole != null) {
                            // هنا من الممكن إضافة منطق التحقق من صحة البيانات
                            // ثم الانتقال إلى الصفحة الرئيسية أو تسجيل الدخول
                            Get.to(() => Login(email: '',));
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check your password, agree to the terms, and select your role")));
                          // }
                        },
                        style: ButtonStyles.blueRounded,
                        child: Text('Sign Up', style: GoogleFonts.lato(fontSize: 20, color: Colors.white)),
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
