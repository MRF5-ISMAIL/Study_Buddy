import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Data/data_model.dart';
import 'package:flutter_application_chat/Screens/Chat/chat_screen.dart';
import 'package:flutter_application_chat/Screens/Dashboard/dashboard.dart';
import 'package:flutter_application_chat/Screens/Dashboard/notifications.dart';
import 'package:flutter_application_chat/Screens/Dashboard/projects.dart';
import 'package:flutter_application_chat/Screens/Dashboard/search_screen.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/Chat/online_user.dart';


String tabSpace = "\t\t\t";

final List<Widget> dashBoardScreens = [
  Dashboard(),
  ProjectScreen(),
  // NotificationScreen(),
  ChatScreen(),
  SearchScreen()
];

List<Color> progressCardGradientList = [
  //grenn
  HexColor.fromHex("87EFB5"),
  //blue
  HexColor.fromHex("8ABFFC"),
  //pink
  HexColor.fromHex("EEB2E8"),
];

final onlineUsers = List.generate(
    AppData.onlineUsers.length,
    (index) => OnlineUser(
          image: AppData.onlineUsers[index]['profileImage'],
          imageBackground: AppData.onlineUsers[index]['color'],
          userName: AppData.onlineUsers[index]['name'],
        ));
