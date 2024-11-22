import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_chat/Screens/Onboarding/onboarding_start.dart';
import 'package:flutter_application_chat/Tasks/controllers/habit_controller.dart';
import 'package:flutter_application_chat/Tasks/controllers/task_controller.dart';
import 'package:flutter_application_chat/Tasks/database/database_service.dart';
import 'package:flutter_application_chat/Tasks/pages/welcome/welcome_screen.dart';
import 'package:flutter_application_chat/Tasks/services/notifications/notification_service.dart';
import 'package:flutter_application_chat/Tasks/services/notifications/pomodoro_notification_service.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

 await NotificationService.init(navigatorKey);
  await PomodoroNotificationService.initialize();
  tz.initializeTimeZones();

  final databaseService = DatabaseService();
  await databaseService.ensureInitialized();

  final taskController = TaskController();
  final habitController = HabitController();

  await taskController.loadTasks();
  await habitController.loadHabits();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: const Color.fromARGB(0, 248, 244, 244),
  //   systemNavigationBarIconBrightness: Brightness.light,
  //   statusBarIconBrightness: Brightness.light,
  // ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => taskController),
      ChangeNotifierProvider(create: (context) => habitController),
      ChangeNotifierProvider(create: (context) => Welcome()),
    ],
    child:MyApp() ,));
}

class MyApp extends StatelessWidget {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 44, 121, 255),
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
      home: OnboardingStart(),
    );
  }
}

class Welcome extends ChangeNotifier {
  bool _isPomodoroActive = false;

  bool get isPomodoroActive => _isPomodoroActive;

  void setPomodoroActive(bool value) {
    _isPomodoroActive = value;
    notifyListeners();
  }
}
