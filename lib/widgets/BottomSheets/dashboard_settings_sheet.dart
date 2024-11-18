import 'package:flutter/material.dart';
import 'package:flutter_application_chat/Values/values.dart';
import 'package:flutter_application_chat/widgets/Buttons/primary_buttons.dart';
import 'package:flutter_application_chat/widgets/Buttons/text_button.dart';
import 'package:flutter_application_chat/widgets/Onboarding/toggle_option.dart';

import 'bottom_sheet_holder.dart';

class DashboardSettingsBottomSheet extends StatelessWidget {
  final ValueNotifier<bool> totalTaskNotifier;
  final ValueNotifier<bool> totalDueNotifier;
  final ValueNotifier<bool> totalCompletedNotifier;
  final ValueNotifier<bool> workingOnNotifier;
  final ValueNotifier<bool> test;
  const DashboardSettingsBottomSheet(
      {Key? key,
      required this.totalTaskNotifier,
      required this.totalDueNotifier,
      required this.totalCompletedNotifier,
      required this.workingOnNotifier,required this.test})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      BottomSheetHolder(),
      AppSpaces.verticalSpace20,
      ToggleLabelOption(label: '    Total Task', notifierValue: totalTaskNotifier, icon: Icons.check_circle_outline),
      ToggleLabelOption(label: '    Task Due Soon', notifierValue: totalDueNotifier, icon: Icons.batch_prediction),
      ToggleLabelOption(label: '    Completed', notifierValue: totalCompletedNotifier, icon: Icons.check_circle),
      ToggleLabelOption(label: '    Working On', notifierValue: workingOnNotifier, icon: Icons.flag),
      ToggleLabelOption(label: '    test On', notifierValue: workingOnNotifier, icon: Icons.flag),

      Spacer(),
      Padding(
        padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppTextButton(
            buttonText: 'Clear All',
            buttonSize: 16,
          ),
          AppPrimaryButton(
            buttonHeight: 60,
            buttonWidth: 160,
            buttonText: "Save Changes",
          )
        ]),
      )
    ]);
  }
}
