// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view/login/user_login_screen_view.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_event.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_state.dart';
// import 'package:image_picker/image_picker.dart';

// class UserSignupScreenView extends StatefulWidget {
//   const UserSignupScreenView({super.key});

//   @override
//   _UserSignupScreenViewState createState() => _UserSignupScreenViewState();
// }

// class _UserSignupScreenViewState extends State<UserSignupScreenView> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   File? _profileImage;
//   String? _selectedGender; // For dropdown

//   final ImagePicker _imagePicker = ImagePicker();

//   void _pickImage(ImageSource source) async {
//     final pickedImage = await _imagePicker.pickImage(source: source);
//     if (pickedImage != null) {
//       setState(() {
//         _profileImage = File(pickedImage.path);
//       });
//     }
//     Navigator.pop(context);
//   }

//   void _register() {
//     if (!_formKey.currentState!.validate()) return;

//     if (_passwordController.text != _confirmPasswordController.text) {
//       _showMessage('Passwords do not match');
//       return;
//     }

//     if (_profileImage == null) {
//       _showMessage('Please upload a profile image');
//       return;
//     }

//     if (_selectedGender == null) {
//       _showMessage('Please select a gender');
//       return;
//     }

//     final userEntity = UserSignupEntity(
//       name: _nameController.text.trim(),
//       email: _emailController.text.trim(),
//       password: _passwordController.text.trim(),
//       profileImagePath: _profileImage!.path,
//     );

//     context.read<UserSignupBloc>().add(SignupUserEvent(userEntity));
//   }

//   void _showMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message), backgroundColor: Colors.red),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<UserSignupBloc, UserSignupState>(
//         listener: (context, state) {
//           if (state is SignupLoadingState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Registering user...')),
//             );
//           } else if (state is SignupSuccessState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const UserLoginScreenView()),
//             );
//           } else if (state is SignupErrorState) {
//             _showMessage(state.message);
//           }
//         },
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),

//                     // Profile Image Picker
//                     GestureDetector(
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (context) => Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ListTile(
//                                 leading: const Icon(Icons.camera),
//                                 title: const Text('Take Photo'),
//                                 onTap: () => _pickImage(ImageSource.camera),
//                               ),
//                               ListTile(
//                                 leading: const Icon(Icons.image),
//                                 title: const Text('Choose from Gallery'),
//                                 onTap: () => _pickImage(ImageSource.gallery),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 60,
//                         backgroundImage: _profileImage != null
//                             ? FileImage(_profileImage!)
//                             : const AssetImage(
//                                     'assets/images/profile_placeholder.png')
//                                 as ImageProvider,
//                         child: _profileImage == null
//                             ? const Icon(Icons.camera_alt,
//                                 size: 40, color: Colors.white)
//                             : null,
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Full Name Field
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Full Name',
//                         border: OutlineInputBorder(),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter your full name';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),

//                     // Email Field
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                           return 'Please enter a valid email address';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),

//                     // Gender Dropdown
//                     DropdownButtonFormField<String>(
//                       value: _selectedGender,
//                       decoration: const InputDecoration(
//                         labelText: 'Gender',
//                         border: OutlineInputBorder(),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       items: const [
//                         DropdownMenuItem(
//                             value: 'Female', child: Text('Female')),
//                         DropdownMenuItem(value: 'Male', child: Text('Male')),
//                         DropdownMenuItem(
//                             value: 'Others', child: Text('Others')),
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedGender = value;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please select a gender';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),

//                     // Password Field
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         if (value.length < 6) {
//                           return 'Password must be at least 6 characters long';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),

//                     // Confirm Password Field
//                     TextFormField(
//                       controller: _confirmPasswordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Confirm Password',
//                         border: OutlineInputBorder(),
//                         filled: true,
//                         fillColor: Colors.white,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please confirm your password';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),

//                     // Register Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _register,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.purple,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           'Register',
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     // Already have an account? Login
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   const UserLoginScreenView()),
//                         );
//                       },
//                       child: const Text.rich(
//                         TextSpan(
//                           text: 'Already have an account? ',
//                           style: TextStyle(color: Colors.black),
//                           children: [
//                             TextSpan(
//                               text: 'Login',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view/login/user_login_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_event.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_state.dart';
import 'package:image_picker/image_picker.dart';

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
  String? _selectedGender; // For gender dropdown
  bool _obscurePassword = true; // For password visibility toggle
  bool _obscureConfirmPassword = true; // For confirm password visibility toggle

  final ImagePicker _imagePicker = ImagePicker();

  void _pickImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
    Navigator.pop(context);
  }

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
    );

    context.read<UserSignupBloc>().add(SignupUserEvent(userEntity));
  }

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserLoginScreenView()),
            );
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

                    // Profile Image Picker
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

                    // Full Name Field
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Phone Number Field with +977 prefix
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        prefixText: '+977 ',
                        prefixStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid 10-digit number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Gender Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedGender,
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'Female', child: Text('Female')),
                        DropdownMenuItem(value: 'Male', child: Text('Male')),
                        DropdownMenuItem(
                            value: 'Others', child: Text('Others')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please select a gender';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password Field
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Already have an account? Login
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const UserLoginScreenView()),
                        );
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
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
          ),
        ),
      ),
    );
  }
}
