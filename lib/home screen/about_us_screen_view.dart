import 'package:flutter/material.dart';

class AboutUsScreenView extends StatelessWidget {
  const AboutUsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFFFFD6F3),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/about us image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color:
                // ignore: deprecated_member_use
                Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to Our App!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB5B2FE),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Our mission is to provide the best salon booking experience for our users. We strive to make beauty and grooming services easily accessible and hassle-free for everyone. With our app, you can explore various salons, book services, and manage your appointments conveniently.',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Why Choose Us?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB5B2FE),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '- Easy and quick booking process\n'
                  '- Verified salons and services\n'
                  '- Secure payment options\n'
                  '- User-friendly interface',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: const Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Colors.pink, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
