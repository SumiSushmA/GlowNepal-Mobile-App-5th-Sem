import 'package:flutter/material.dart';

class StylistListScreen extends StatelessWidget {
  final String category;

  StylistListScreen({super.key, required this.category});

  final List<String> stylists = [
    "Alice Johnson",
    "David Smith",
    "Sophia Lee",
    "Michael Brown",
    "Emma Wilson"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stylists in $category")),
      body: ListView.builder(
        itemCount: stylists.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stylists[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/stylistDetail',
                  arguments: stylists[index]);
            },
          );
        },
      ),
    );
  }
}
