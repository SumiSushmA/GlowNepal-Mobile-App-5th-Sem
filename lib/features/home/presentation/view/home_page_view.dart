import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/see_all_stylish_view.dart';

import 'stylish_screen_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hello, Sushma',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Welcome to GlowNepal'),
                  ],
                ),
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile_image.png'),
                  radius: 24,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),

            const SizedBox(height: 24),

            // Service Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryIcon(Icons.face, 'Hair'),
                  _buildCategoryIcon(Icons.spa, 'Body Spa'),
                  _buildCategoryIcon(Icons.brush, 'Makeup'),
                  _buildCategoryIcon(Icons.handshake, 'Nail'),
                  _buildCategoryIcon(Icons.more_horiz, 'More'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Beauty Specialists
            _buildSectionTitle('Beauty Specialist', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeeAllStylishView(
                    specialists: [
                      Specialist('Sumi', 'Hair Specialist', 4.0,
                          'assets/images/stylish 1.jpg'),
                      Specialist('Nitika', 'Nail Stylist', 5.0,
                          'assets/images/stylish 2.jpg'),
                      Specialist('Sushmita', 'Makeup Artist', 4.5,
                          'assets/images/stylish 3.jpg'),
                    ],
                  ),
                ),
              );
            }),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSpecialistCard(context, 'Sumi', 'Hair Specialist', 4.0,
                      'assets/images/stylish 1.jpg'),
                  _buildSpecialistCard(context, 'Nitika', 'Nail Stylist', 5.0,
                      'assets/images/stylish 2.jpg'),
                  _buildSpecialistCard(context, 'Sushmita', 'Makeup Artist',
                      4.5, 'assets/images/stylish 3.jpg'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Best Offers
            _buildSectionTitle('Best Offers', () {}),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'For all makeup',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '50% OFF',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.shopping_bag, size: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.pink[100],
            child: Icon(icon, color: Colors.pink),
          ),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildSpecialistCard(BuildContext context, String name, String role,
      double rating, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StylishScreenView(
              name: name,
              role: role,
              rating: rating,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 40,
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(role),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 16),
                Text('$rating'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'See All',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
