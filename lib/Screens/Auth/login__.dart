import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Screens/Auth/choose_plan.dart';
import 'package:flutter_application_chat/Screens/Auth/new_workspace.dart';
import 'package:flutter_application_chat/Screens/Auth/signup.dart';
import 'package:flutter_application_chat/Screens/Onboarding/onboarding_carousel.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:flutter_application_chat/widgets/Forms/form_input_with%20_label.dart';
import 'package:flutter_application_chat/widgets/Navigation/back.dart';
import 'package:flutter_application_chat/widgets/Onboarding/image_outlined_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  final String email;

  const Login({Key? key, required this.email}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  TextEditingController _passController = new TextEditingController();
  TextEditingController _nameController =new TextEditingController();
  bool obscureText = true;
 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // زر الرجوع
                  NavigationBack(),
                  AppSpaces.verticalSpace40,

                  // عنوان تسجيل الدخول
                  Text(
                    'Login',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpaces.verticalSpace20,

                  // النص الإرشادي
                  RichText(
                    text: TextSpan(
                      text: 'Using  ',
                      style: GoogleFonts.lato(
                        color: HexColor.fromHex("676979"),
                      ),
                      children: [
                        TextSpan(
                          text: widget.email,
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "  to login.",
                          style: GoogleFonts.lato(
                            color: HexColor.fromHex("676979"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpaces.verticalSpace40,

                  // حقل البريد الإلكتروني
                  LabelledFormInput(
                    placeholder: "Email",
                    keyboardType: "text",
                    controller: _nameController,
                    obscureText: false,
                    label: "Your Email",
                  ),
                  AppSpaces.verticalSpace40,

                  // حقل كلمة المرور
                  LabelledFormInput(
                    placeholder: "Password",
                    keyboardType: "text",
                    controller: _passController,
                    obscureText: !obscureText,
                    label: "Your Password",
                  ),
                  AppSpaces.verticalSpace40,

                  // نص استعادة كلمة المرور
                  InkWell(
                    onTap: () {
                      Get.to(() => SignUp(email: widget.email));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Forgot your password?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: HexColor.fromHex("666A7A"),
                        ),
                      ),
                    ),
                  ),
                  AppSpaces.verticalSpace20,

                  // زر تسجيل الدخول
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => ChoosePlan());
                      },
                      style: ButtonStyles.blueRounded,
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AppSpaces.verticalSpace20,

                  // أزرار تسجيل الدخول باستخدام Google وFacebook
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButtonWithImage(
                          imageUrl: "assets/google_icon.png",
                          onPressed: SignUsingGoogle,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OutlinedButtonWithImage(
                          imageUrl: "assets/facebook_icon.png",
                        ),
                      ),
                    ],
                  ),
                  AppSpaces.verticalSpace20,

                  // نص إنشاء حساب جديد
                 InkWell(
  onTap: () {
    Get.to(() => SignUp(email: widget.email));
  },
  child: Align(
    alignment: Alignment.center, // لجعل النص في المنتصف أفقيًا
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "Don't have an account?",
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 15,
          color: HexColor.fromHex("666A7A"),
        ),
      ),
    ),
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

Future<void> SignUsingGoogle() async {
  try {
    // خطوة 1: تسجيل الدخول عبر Google
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // إذا تم إلغاء تسجيل الدخول
      return;
    }

    // خطوة 2: الحصول على بيانات التفويض من Google
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // خطوة 3: إنشاء بيانات اعتماد Firebase باستخدام التوكن من Google
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // خطوة 4: تسجيل الدخول باستخدام بيانات اعتماد Google في Firebase
    await FirebaseAuth.instance.signInWithCredential(credential);

    print("تم تسجيل الدخول بنجاح باستخدام Google.");
        Get.to(() => ChoosePlan());
  } catch (e) {
    print("حدث خطأ أثناء تسجيل الدخول باستخدام Google: $e");
  }
}
