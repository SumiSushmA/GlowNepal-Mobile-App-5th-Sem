import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/home%20screen/stylish_screen_view.dart';

class SeeAllStylishView extends StatelessWidget {
  final List<Specialist> specialists;

  const SeeAllStylishView({required this.specialists, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Specialists'),
      ),
      body: ListView.builder(
        itemCount: specialists.length,
        itemBuilder: (context, index) {
          final specialist = specialists[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(specialist.imagePath),
            ),
            title: Text(specialist.name),
            subtitle: Text(specialist.role),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 16),
                Text('${specialist.rating}'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StylishScreenView(
                    name: specialist.name,
                    role: specialist.role,
                    rating: specialist.rating,
                    imagePath: specialist.imagePath,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Specialist {
  final String name;
  final String role;
  final double rating;
  final String imagePath;

  Specialist(this.name, this.role, this.rating, this.imagePath);
}
