import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            const SizedBox(height: 16),
            const Text("Full Name: John Doe",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Email: johndoe@gmail.com",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Edit Profile Logic
              },
              child: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
