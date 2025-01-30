import 'package:flutter/material.dart';

class StylistDetailScreen extends StatelessWidget {
  final String stylistName;

  const StylistDetailScreen({super.key, required this.stylistName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(stylistName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(stylistName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text("Experience: 5 Years"),
            const Text("Booking Fee: \$50"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Booking Logic
              },
              child: const Text("Book Appointment"),
            ),
          ],
        ),
      ),
    );
  }
}
