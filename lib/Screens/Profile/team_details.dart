import 'package:flutter/material.dart';
import 'package:flutter_application_chat/BottomSheets/bottom_sheets.dart';
import 'package:flutter_application_chat/Constants/constants.dart';
import 'package:flutter_application_chat/Data/data_model.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/Buttons/primary_tab_buttons.dart';
import 'package:flutter_application_chat/widgets/DarkBackground/darkRadialBackground.dart';
import 'package:flutter_application_chat/widgets/Dashboard/in_bottomsheet_subtitle.dart';
import 'package:flutter_application_chat/widgets/Navigation/app_header.dart';
import 'package:flutter_application_chat/widgets/Projects/project_card_vertical.dart';
import 'package:flutter_application_chat/widgets/Team/more_team_details_sheet.dart';
import 'package:flutter_application_chat/widgets/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';


import 'my_team.dart';

class TeamDetails extends StatelessWidget {
  final String title;
  TeamDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _settingsButtonTrigger = ValueNotifier(0);

    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                TaskezAppHeader(
                    title: "$tabSpace $title Team",
                    widget: InkWell(
                        onTap: () {
                          showAppBottomSheet(
                            Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                  height: Utils.screenHeight * 0.9,
                                  child: MoreTeamDetailsSheet()),
                            ),
                            isScrollControlled: true,
                          );
                        },
                        child: Icon(Icons.more_horiz,
                            size: 30, color: Colors.white))),
                AppSpaces.verticalSpace40,
                //tab indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PrimaryTabButton(
                        buttonText: "Overview",
                        itemIndex: 0,
                        notifier: _settingsButtonTrigger),
                    PrimaryTabButton(
                        buttonText: "Calendar",
                        itemIndex: 1,
                        notifier: _settingsButtonTrigger),
                  ],
                ),

                AppSpaces.verticalSpace40,
                TeamStory(
                    teamTitle: title, numberOfMembers: "12", noImages: "8"),
                AppSpaces.verticalSpace10,
                InBottomSheetSubtitle(
                    title:
                        "We're a growing family of 371,521 designers and \nmakers from around the world.",
                    textStyle:
                        GoogleFonts.lato(fontSize: 15, color: Colors.white70)),
                AppSpaces.verticalSpace40,
                ValueListenableBuilder(
                    valueListenable: _settingsButtonTrigger,
                    builder: (BuildContext context, _, __) {
                      return _settingsButtonTrigger.value == 0
                          ? Expanded(child: TeamProjectOverview())
                          : CalendarView();
                    })
              ])))
    ]));
  }
}

class TeamProjectOverview extends StatelessWidget {
  const TeamProjectOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //change
        crossAxisCount: 2,
        mainAxisSpacing: 10,

        //change height 125
        mainAxisExtent: 220,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (_, index) => ProjectCardVertical(
        projectName: AppData.productData[index]['projectName'],
        category: AppData.productData[index]['category'],
        color: AppData.productData[index]['color'],
        ratingsUpperNumber: AppData.productData[index]['ratingsUpperNumber'],
        ratingsLowerNumber: AppData.productData[index]['ratingsLowerNumber'],
        image: "assets/ChatGPT-removebg-preview.png",
      ),
      itemCount: 4,
    );
  }
}
