import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Effective Date: [Insert Date]",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 252, 252, 252),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Introduction",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and protect your information when you use our application. Please read this policy carefully to understand our practices regarding your personal data.",
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(137, 255, 255, 255)),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              "Information We Collect",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "We may collect the following types of information:\n"
              "- Personal information (e.g., name, email address, phone number).\n"
              "- Usage data (e.g., interactions with the app, preferences).\n"
              "- Device information (e.g., device type, operating system, IP address).",
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(137, 253, 253, 253)),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              "How We Use Your Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "We use the information we collect to:\n"
              "- Provide and improve our services.\n"
              "- Personalize your experience.\n"
              "- Communicate with you about updates, offers, and support.\n"
              "- Ensure the security of our application.",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              "Your Rights",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "You have the right to:\n"
              "- Access your personal data.\n"
              "- Request corrections to your data.\n"
              "- Request the deletion of your data.\n"
              "- Withdraw consent for data processing.",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "If you have any questions or concerns about this Privacy Policy, please contact us at:\n"
              "Email: support@example.com\n"
              "Phone: +123 456 7890",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
