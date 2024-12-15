import 'package:flutter/material.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({super.key});

  @override
  _RegisterScreenViewState createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
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
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  // Back Button
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Title
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
                  _buildPasswordField('Password', _isPasswordVisible, (value) {
                    setState(() {
                      _isPasswordVisible = value;
                    });
                  }),
                  const SizedBox(height: 16),

                  // Confirm Password Field
                  _buildPasswordField(
                      'Confirm Password', _isConfirmPasswordVisible, (value) {
                    setState(() {
                      _isConfirmPasswordVisible = value;
                    });
                  }),
                  const SizedBox(height: 16),

                  // Sign Up Button
                  ElevatedButton(
                    onPressed: () {
                      print("Sign Up Clicked");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBACDFF),
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

                  // Or Sign In With
                  const Text(
                    'Or sign in with',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 16),

                  // Social Media Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton('assets/icons/google.png', () {
                        print("Google Sign-In");
                      }),
                      const SizedBox(width: 16),
                      _buildSocialButton('assets/icons/facebook.png', () {
                        print("Facebook Sign-In");
                      }),
                      const SizedBox(width: 16),
                      _buildSocialButton('assets/icons/apple.png', () {
                        print("Apple Sign-In");
                      }),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Login Navigation
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context,
                          '/login'); // Ensure '/login' is registered in your routes
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Have an account? ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for text fields
  Widget _buildTextField(String label, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // Helper method for password fields with visibility toggle
  Widget _buildPasswordField(
      String label, bool isVisible, ValueChanged<bool> onVisibilityChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        obscureText: !isVisible,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              onVisibilityChanged(!isVisible);
            },
          ),
        ),
      ),
    );
  }

  // Helper method for social buttons
  Widget _buildSocialButton(String assetPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25, // Slightly larger button size
        child: Image.asset(
          assetPath,
          width: 30, // Larger logo size
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
