import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/login_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/Contact_Us_View.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/Edit_Profile_View.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/theme_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color primaryColor = Color(0xFFBB86FC);
const Color secondaryColor = Color(0xFF6200EE);

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _nameController = TextEditingController(text: 'Sushma');
  final _phoneController = TextEditingController(text: '+977 9999999999');
  final _usernameController = TextEditingController(text: 'sushma');
  final _passwordController = TextEditingController(text: 'sushma123');
  final _emailController = TextEditingController(text: 'sushma@email.com');
  final _addressController = TextEditingController(text: 'KTM');
  final _dobController = TextEditingController(text: '2004-09-08');
  final String _selectedGender = 'Female';
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _logout() async {
    if (!context.mounted) return;

    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure? You want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Close dialog

              final sharedPrefs = await SharedPreferences.getInstance();
              await sharedPrefs.remove('token'); // Remove user session

              // ✅ Wrap LoginView with BlocProvider<LoginBloc>
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => getIt<LoginBloc>(),
                    child: LoginView(),
                  ),
                ),
                (route) => false, // Clears navigation stack
              );
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      print("User logged out successfully!");
    }
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileView(
          nameController: _nameController,
          phoneController: _phoneController,
          usernameController: _usernameController,
          passwordController: _passwordController,
          emailController: _emailController,
          addressController: _addressController,
          dobController: _dobController,
          selectedGender: _selectedGender,
        ),
      ),
    );
  }

  void _openContactUs() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ContactUsView()),
    );
  }

  void _toggleTheme() {
    context.read<ThemeCubit>().toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : const AssetImage("assets/default_profile.png")
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () => _pickImage(ImageSource.gallery),
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.edit, color: secondaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _nameController.text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Text(
                _emailController.text,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 20),
              _buildProfileOption("Edit Profile Information", Icons.edit,
                  onTap: _editProfile),
              _buildProfileOption("Theme", Icons.color_lens,
                  trailing: Text(
                    themeState == ThemeState.dark ? "Dark Mode" : "Light Mode",
                    style: const TextStyle(color: secondaryColor),
                  ),
                  onTap: _toggleTheme),
              _buildProfileOption("Contact Us", Icons.phone,
                  onTap: _openContactUs),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _logout,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                  child: const Text("Logout",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(String title, IconData icon,
      {Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: secondaryColor),
      title: Text(title, style: const TextStyle(color: secondaryColor)),
      trailing: trailing ??
          const Icon(Icons.arrow_forward_ios, size: 16, color: secondaryColor),
      onTap: onTap,
    );
  }
}
