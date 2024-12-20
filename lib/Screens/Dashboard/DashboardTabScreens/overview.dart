import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Data/data_model.dart';
import 'package:flutter_application_chat/Tasks/pages/task/tasks_page.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/Dashboard/overview_task_container.dart';
import 'package:flutter_application_chat/widgets/Dashboard/task_progress_card.dart';
import 'package:get/get.dart';

import 'package:tcard/tcard.dart';

class DashboardOverview extends StatefulWidget {
  const DashboardOverview({Key? key}) : super(key: key);

  @override
  State<DashboardOverview> createState() => _DashboardOverviewState();
}
      bool areCardsVisible = true;

class _DashboardOverviewState extends State<DashboardOverview> {
  @override
  Widget build(BuildContext context) {
    final dynamic data = AppData.progressIndicatorList;
    List<Widget> cards = List.generate(
        5,
        (index) => TaskProgressCard(
              cardTitle: data[index]['cardTitle'],
              rating: data[index]['rating'],
              progressFigure: data[index]['progress'],
              percentageGap: int.parse(data[index]['progressBar']),
              
            )
            
            );

    return Column(
      children: [
        if (areCardsVisible) ...[
        Container(
          height: 150,
          child: TCard(
            cards: cards,
            onEnd: () {
              setState((){
                   areCardsVisible = false;

              });
            },
          ),
        
        ),
        AppSpaces.verticalSpace10,
        ],
        Column(
          children: [
            
            InkWell(
              child: OverviewTaskContainer(
                  cardTitle: "Total Task",
                  numberOfItems: "16",
                  imageUrl: "assets/orange_pencil.png",
                  backgroundColor: HexColor.fromHex("EFA17D")),
            onTap: (){
          Get.to(() => TasksPage());
            },)
            ,
            OverviewTaskContainer(
                cardTitle: "Completed",
                numberOfItems: "32",
                imageUrl: "assets/green_pencil.png",
                backgroundColor: HexColor.fromHex("7FBC69")),
            OverviewTaskContainer(
                cardTitle: "Total Projects",
                numberOfItems: "8",
                imageUrl: "assets/cone.png",
                backgroundColor: HexColor.fromHex("EDA7FA")),
                  OverviewTaskContainer(
                cardTitle: "Total Projects",
                numberOfItems: "8",
                imageUrl: "assets/cone.png",
                backgroundColor: HexColor.fromHex("EDA7FA")),
          ],
        ),
      ],
    );
  }
}
