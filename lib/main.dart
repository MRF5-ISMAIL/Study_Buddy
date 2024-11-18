import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: const Color.fromARGB(0, 248, 244, 244),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color.fromARGB(255, 170, 63, 63),
    colorScheme: ColorScheme.light(secondary: const Color.fromARGB(255, 34, 84, 169)),  // استبدال accentColor بـ colorScheme
    // تخصيص إضافي للوضع النهاري
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black87,
    colorScheme: ColorScheme.dark(secondary: Colors.lightBlueAccent),  // استبدال accentColor بـ colorScheme
    // تخصيص إضافي للوضع الليلي
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Buddy',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:ThemeMode.dark,
      home: SplashScreen(),
    );
  }
}
