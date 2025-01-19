import 'package:flutter/material.dart';

class StylishScreenView extends StatelessWidget {
  final String name;
  final String role;
  final double rating;
  final String imagePath;

  const StylishScreenView({
    super.key,
    required this.name,
    required this.role,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 80,
                ),
              ),
              const SizedBox(height: 16),

              // Name and Role
              Center(
                child: Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow[700], size: 24),
                  const SizedBox(width: 4),
                  Text(
                    '$rating',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // About the Specialist
              const Text(
                'About Specialist',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sumi is a skilled hair specialist known for her expertise in hairstyling, coloring, and treatments. She offers personalized consultations to enhance individual beauty and confidence. .',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 24),

              // Services Offered
              const Text(
                'Services Offered',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  _buildServiceTile('Hair Cutting', '\$20'),
                  _buildServiceTile('Hair Coloring', '\$40'),
                  _buildServiceTile('Hair Styling', '\$30'),
                  _buildServiceTile('Special Hair Treatment', '\$50'),
                ],
              ),

              const SizedBox(height: 24),

              // Book Appointment Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Services
  Widget _buildServiceTile(String service, String price) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(service, style: const TextStyle(fontSize: 16)),
      trailing: Text(price, style: const TextStyle(fontSize: 16)),
    );
  }
}
