import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Us")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Our Office",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("GlowNepal Beauty & Salon"),
            const Text("123 Main Street, Kathmandu, Nepal"),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.phone, color: Colors.red),
                SizedBox(width: 8),
                Text("+977 9812345678")
              ],
            ),
            const Row(
              children: [
                Icon(Icons.email, color: Colors.purple),
                SizedBox(width: 8),
                Text("support@glownepal.com")
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Open email app
              },
              child: const Text("Send Email"),
            )
          ],
        ),
      ),
    );
  }
}
