import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Us")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome to GlowNepal!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
                "GlowNepal is a beauty and wellness platform that connects users with top stylists and beauty experts."),
            const SizedBox(height: 16),
            const Text("Our Vision",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text(
                "Our vision at GlowNepal is to revolutionize the beauty industry by making expert services more accessible."),
          ],
        ),
      ),
    );
  }
}
