import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_chat/Screens/Auth/choose_plan.dart';
import 'package:flutter_application_chat/Screens/Auth/login__.dart';
import 'package:flutter_application_chat/Screens/Auth/signup.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:flutter_application_chat/widgets/Onboarding/slider_captioned_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnboardingCarousel extends StatefulWidget {
  @override
  _OnboardingCarouselState createState() => _OnboardingCarouselState();
}

class _OnboardingCarouselState extends State<OnboardingCarousel> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

void _startAutoScroll() {
  _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    if (_currentPage < _numPages - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  });
}


  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? HexColor.fromHex("266FFE") : HexColor.fromHex("666A7A"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Stack(children: [
              DarkRadialBackground(
                color: HexColor.fromHex("#181a1f"),
                position: "bottomRight",
              ),
              Column(children: [
                Container(
                    height: Utils.screenHeight * 1.3,
                    child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: const <Widget>[
                          SliderCaptionedImage(
                              index: 0, imageUrl: "assets/slider-background-1.png", caption: "Task,\nCalendar,\nChat"),
                          SliderCaptionedImage(
                              index: 1, imageUrl: "assets/slider-background-3.png", caption: "Work\nAnywhere\nEasily"),
                          SliderCaptionedImage(
                              index: 2,
                              imageUrl: "assets/slider-background-2.png",
                              caption: "Manage\nEverything\nOn Phone")
                        ])),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: _buildPageIndicator(),
                      ),
                      SizedBox(height: 50),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Get.to(() => SignUp(email: ""));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(HexColor.fromHex("246CFE")),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: HexColor.fromHex("246CFE")),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.person_add, color: Colors.white),
                              label: Text(
                                'Sign up',
                                style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Get.to(() => Login(email: ""));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(HexColor.fromHex("246CFE")),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: HexColor.fromHex("246CFE")),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.login, color: Colors.white),
                              label: Text(
                                'Sign in',
                                style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                    //       AppSpaces.verticalSpace20,
                    //         RichText(
                    //   text: TextSpan(
                    //     text: 'Develop By ',
                    //     style: GoogleFonts.lato(fontSize: 18, color: HexColor.fromHex("FDA5FF")),
                    //     children: <TextSpan>[
                    //       TextSpan(
                    //         text: '🙌',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                        ],
                        
                      ),
                    ],
                  ),
                ),
              ])
            ])));
  }
}

Future<void> SignUsingGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("تم تسجيل الدخول بنجاح باستخدام Google.");
    Get.to(() => ChoosePlan());
  } catch (e) {
    print("حدث خطأ أثناء تسجيل الدخول باستخدام Google: $e");
  }
}
