import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/Search/active_task_card.dart';
import 'package:flutter_application_chat/widgets/Search/inactive_task_card.dart';


class SearchTaskCard extends StatelessWidget {
  final bool activated;
  final String header;
  final String subHeader;
  final String date;
  SearchTaskCard(
      {Key? key,
      required this.date,
      required this.activated,
      required this.header,
      required this.subHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool newBool = this.activated;
    ValueNotifier<bool> _totalDueTrigger = ValueNotifier(newBool);

    return ValueListenableBuilder(
        valueListenable: _totalDueTrigger,
        builder: (BuildContext context, _, __) {
          return _totalDueTrigger.value
              ? Column(children: [
                  InactiveTaskCard(
                      header: header,
                      notifier: _totalDueTrigger,
                      subHeader: subHeader,
                      date: date),
                  AppSpaces.verticalSpace10
                ])
              : Column(children: [
                  ActiveTaskCard(
                      header: header,
                      notifier: _totalDueTrigger,
                      subHeader: subHeader,
                      date: date),
                  AppSpaces.verticalSpace10
                ]);
        });
  }
}
