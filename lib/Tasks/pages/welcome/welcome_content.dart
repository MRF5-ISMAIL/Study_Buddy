class WelcomePageContent {
  final String title;
  final String lottieAsset;
  final String description;

  WelcomePageContent({
    required this.title,
    required this.lottieAsset,
    required this.description,
  });
}

List<WelcomePageContent> welcomePages = [
  WelcomePageContent(
    title: "Organize Your Day",
    lottieAsset: "lib/Tasks/assets/lottie/tasks.json",
    description: "Organize, prioritize, and accomplish your tasks with ease.",
  ),
  WelcomePageContent(
    title: "Build Good Habits",
    lottieAsset: "lib/Tasks/assets/lottie/habits.json",
    description: "Develop and maintain positive habits for personal growth.",
  ),
  WelcomePageContent(
    title: "Stay Focused",
    lottieAsset: "lib/Tasks/assets/lottie/focus.json",
    description: "Enhance your productivity with our focus timer.",
  ),
];