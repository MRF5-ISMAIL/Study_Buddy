import 'package:flutter/cupertino.dart';
import 'tutorial_overlay.dart';

class PomodoroTutorial {
  static List<TutorialPage> pages = [
    TutorialPage(
      instruction: 'Set your focus and break durations',
      imageAsset: 'lib/Tasks/assets/tutorials/pomodoro/set_durations.png',
    ),
    TutorialPage(
      instruction: 'Start your Pomodoro session',
      imageAsset: 'lib/Tasks/assets/tutorials/pomodoro/start_session.png',
    ),
    TutorialPage(
      instruction: 'Track your session',
      imageAsset: 'lib/Tasks/assets/tutorials/pomodoro/track_session.png',
    ),
  ];

  static Widget build(BuildContext context, VoidCallback onComplete) {
    return TutorialOverlay(
      pages: pages,
      onComplete: onComplete,
    );
  }
}
