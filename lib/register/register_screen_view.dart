import 'package:flutter/material.dart';

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFEDEE0), // Soft pink
              Color(0xFFD6E5FA), // Light blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Back Button and Title
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Text(
                'GlowNepal',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),

              // Full Name Field
              _buildTextField('Full Name', false),
              const SizedBox(height: 16),

              // Email Field
              _buildTextField('Email', false),
              const SizedBox(height: 16),

              // Password Field
              _buildTextField('Password', true),
              const SizedBox(height: 16),

              // Confirm Password Field
              _buildTextField('Confirm Password', true),
              const SizedBox(height: 16),

              // Sign Up Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBACDFF), // Light blue button
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Social Media Login Row
              const Text(
                'Or sign in with',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton('assets/google_icon.png'),
                  const SizedBox(width: 16),
                  _buildSocialButton('assets/facebook_icon.png'),
                  const SizedBox(width: 16),
                  _buildSocialButton('assets/apple_icon.png'),
                ],
              ),

              const SizedBox(height: 32),

              // Login Navigation
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Have an account? Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for input fields
  Widget _buildTextField(String label, bool obscureText) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: obscureText ? const Icon(Icons.visibility) : null,
      ),
    );
  }

  // Helper method for social media buttons
  Widget _buildSocialButton(String assetPath) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Image.asset(
          assetPath,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
