import 'package:flutter/material.dart';
import 'package:flutter_application_chat/BottomSheets/bottom_sheets.dart';
import 'package:flutter_application_chat/Constants/constants.dart';
import 'package:flutter_application_chat/Screens/Dashboard/dashboard.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:flutter_application_chat/widgets/Dashboard/bottomNavigationItem.dart';
import 'package:flutter_application_chat/widgets/Dashboard/dashboard_add_icon.dart';
import 'package:flutter_application_chat/widgets/Dashboard/dashboard_add_sheet.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Timeline extends StatefulWidget {
  Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);

  StatelessWidget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor.fromHex("#181a1f"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          ValueListenableBuilder(
              valueListenable: bottomNavigatorTrigger,
              builder: (BuildContext context, _, __) {
                return PageStorage(
                    child: dashBoardScreens[bottomNavigatorTrigger.value],
                    bucket: bucket);
              })
        ]),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 90,
            padding: EdgeInsets.only(top: 10, right: 30, left: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: HexColor.fromHex("#181a1f").withOpacity(0.8)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationItem(
                      itemIndex: 0,
                      notifier: bottomNavigatorTrigger,
                      icon: Icons.widgets),
                  Spacer(),
                  BottomNavigationItem(
                      itemIndex: 1,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.clipboard),
                  Spacer(),
                  DashboardAddButton(
                    iconTapped: (() {
                      showAppBottomSheet(Container(
                          height: Utils.screenHeight * 0.8,
                          child: DashboardAddBottomSheet()));
                    }),
                  ),
                  Spacer(),
                  BottomNavigationItem(
                      itemIndex: 2,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.messageCircle),
                  Spacer(),
                  BottomNavigationItem(
                      itemIndex: 3,
                      notifier: bottomNavigatorTrigger,
                      icon: FeatherIcons.search)
                ])));
  }
}
