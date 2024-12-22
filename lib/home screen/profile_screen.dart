import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/home%20screen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _fullNameController =
      TextEditingController(text: "Sushma Sharma");
  final TextEditingController _emailController =
      TextEditingController(text: "s@gmail.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "98214567xxxx");
  final TextEditingController _passwordController =
      TextEditingController(text: "password123");

  bool _isPasswordVisible = false;
  bool _isEditing = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      const AssetImage('assets/images/profile image.png'),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, color: Colors.orange, size: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _fullNameController,
                readOnly: !_isEditing,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat Regular',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                readOnly: !_isEditing,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat Regular',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                readOnly: !_isEditing,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat Regular',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                readOnly: !_isEditing,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat Regular',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _toggleEditing,
                    child: Text(_isEditing ? 'Save' : 'Edit Profile'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
