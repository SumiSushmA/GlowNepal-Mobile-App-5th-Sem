import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_event.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserSignupScreenView extends StatefulWidget {
  const UserSignupScreenView({super.key});

  @override
  _UserSignupScreenViewState createState() => _UserSignupScreenViewState();
}

class _UserSignupScreenViewState extends State<UserSignupScreenView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  File? _profileImage;
  String? _selectedGender;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final ImagePicker _imagePicker = ImagePicker();

  /// **📷 Check Camera & Gallery Permissions**
  Future<void> _checkPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.photos,
      Permission.storage,
    ].request();

    if (statuses[Permission.camera]!.isDenied ||
        statuses[Permission.photos]!.isDenied ||
        statuses[Permission.storage]!.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied')),
      );
    }
  }

  /// **📷 Pick Image from Camera/Gallery**
  Future<void> _pickImage(ImageSource source) async {
    await _checkPermission();

    try {
      final pickedImage = await _imagePicker.pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          _profileImage = File(pickedImage.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
    Navigator.pop(context);
  }

  /// **🚀 Register User**
  void _register() {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      _showMessage('Passwords do not match');
      return;
    }

    if (_profileImage == null) {
      _showMessage('Please upload a profile image');
      return;
    }

    if (_selectedGender == null) {
      _showMessage('Please select a gender');
      return;
    }

    final userEntity = UserSignupEntity(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      profileImagePath: _profileImage!.path,
      phone: '+977 ${_phoneController.text.trim()}',
      gender: _selectedGender!,
    );

    context.read<UserSignupBloc>().add(SignupUserEvent(userEntity));
  }

  /// **🔔 Show Error Message**
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserSignupBloc, UserSignupState>(
        listener: (context, state) {
          if (state is SignupLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registering user...')),
            );
          } else if (state is SignupSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pop(context); // ✅ Navigate back to login after success
          } else if (state is SignupErrorState) {
            _showMessage(state.message);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    /// **📷 Profile Image Upload**
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera),
                                title: const Text('Take Photo'),
                                onTap: () => _pickImage(ImageSource.camera),
                              ),
                              ListTile(
                                leading: const Icon(Icons.image),
                                title: const Text('Choose from Gallery'),
                                onTap: () => _pickImage(ImageSource.gallery),
                              ),
                            ],
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : const AssetImage(
                                    'assets/images/profile_placeholder.png')
                                as ImageProvider,
                        child: _profileImage == null
                            ? const Icon(Icons.camera_alt,
                                size: 40, color: Colors.white)
                            : null,
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// **👤 Full Name**
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// **📧 Email**
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// **📞 Phone Number (Always Starts with +977)**
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                        prefixText: '+977 ',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter a valid 10-digit phone number';
                        }
                        if (value.length != 10) {
                          return 'Phone number must be 10 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    /// **⚤ Gender Dropdown**
                    DropdownButtonFormField<String>(
                      value: _selectedGender,
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Male', 'Female', 'Other']
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    /// **🔒 Password**
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// **🔒 Confirm Password**
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// **🚀 Register Button**
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// **🔄 Already Have an Account? Login**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? ',
                            style: TextStyle(color: Colors.black54)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
