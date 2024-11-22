import 'package:flutter/material.dart';
import 'package:flutter_application_chat/BottomSheets/bottom_sheets.dart';
import 'package:flutter_application_chat/Screens/Chat/chat_screen.dart';
import 'package:flutter_application_chat/Screens/Dashboard/notifications.dart';
import 'package:flutter_application_chat/Screens/Profile/profile_overview.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/BottomSheets/dashboard_settings_sheet.dart';
import 'package:flutter_application_chat/widgets/Buttons/primary_tab_buttons.dart';
import 'package:flutter_application_chat/widgets/Navigation/dasboard_header.dart';
import 'package:flutter_application_chat/widgets/Shapes/app_settings_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'DashboardTabScreens/overview.dart';
import 'DashboardTabScreens/productivity.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  ValueNotifier<bool> _totalTaskTrigger = ValueNotifier(true);
  ValueNotifier<bool> _totalDueTrigger = ValueNotifier(false);
  ValueNotifier<bool> _totalCompletedTrigger = ValueNotifier(true);
  ValueNotifier<bool> _workingOnTrigger = ValueNotifier(false);
  ValueNotifier<int> _buttonTrigger = ValueNotifier(0);
  ValueNotifier<bool> _test=ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DashboardNav(
                icon: FontAwesomeIcons.bell,
                image: "assets/man-head.png",
                notificationCount: "8",
                page: NotificationScreen(),
                title: "Dashboard",
                onImageTapped: () {
                  Get.to(() => ProfileOverview());
                },
              ),
              AppSpaces.verticalSpace20,
              Text("Hello,\nDereck Doyle 👋",
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              AppSpaces.verticalSpace20,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                //tab indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PrimaryTabButton(buttonText: "Overview", itemIndex: 0, notifier: _buttonTrigger),
                    PrimaryTabButton(buttonText: "Productivity", itemIndex: 1, notifier: _buttonTrigger)
                  ],
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: AppSettingsIcon(
                      callback: () {
                        showAppBottomSheet(
                          DashboardSettingsBottomSheet(
                            totalTaskNotifier: _totalTaskTrigger,
                            totalDueNotifier: _totalDueTrigger,
                            workingOnNotifier: _workingOnTrigger,
                            totalCompletedNotifier: _totalCompletedTrigger,
                            test: _test,
                          ),
                        );
                      },
                    ))
              ]),
              if(_totalTaskTrigger==false)
              AppSpaces.verticalSpace20,
              ValueListenableBuilder(
                  valueListenable: _buttonTrigger,
                  builder: (BuildContext context, _, __) {
                    return _buttonTrigger.value == 0 ? DashboardOverview() : DashboardProductivity();
                  })
            ]),
          ),
        ));
  }
}
