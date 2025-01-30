import 'package:flutter/material.dart';

class StylistCategoryScreen extends StatelessWidget {
  final List<String> categories = [
    "Hair Stylist",
    "Makeup Artist",
    "Nail Technician",
    "Facial & Skincare",
    "Massage Therapist",
    "Eyebrow & Lash Expert"
  ];

  StylistCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Stylist Category")),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/stylistList',
                  arguments: categories[index]);
            },
          );
        },
      ),
    );
  }
}
