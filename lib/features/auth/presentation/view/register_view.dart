// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glow_nepal/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final _gap = const SizedBox(height: 8);
//   final _key = GlobalKey<FormState>();

//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _dobController = TextEditingController();
//   final _genderController = TextEditingController();

// // File? _img;
//   File _img = File(''); // Empty file initialization

//   Future<void> checkCameraPermission() async {
//     if (await Permission.camera.request().isDenied) {
//       await Permission.camera.request();
//     }
//   }

//   Future _browseImage(ImageSource imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource);
//       if (image != null) {
//         setState(() {
//           _img = File(image.path);

//           context.read<RegisterBloc>().add(UploadImage(file: _img));
//         });
//       } else {
//         return;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Register'), centerTitle: true),
//       body: SafeArea(
//         child: BlocListener<RegisterBloc, RegisterState>(
//           listener: (context, state) {
//             if (state.isSuccess) {
//               // ✅ Fixed: Using isSuccess instead of RegisterSuccess
//               // Navigator.pushReplacement(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => LoginView()),
//               // );

//               Navigator.pop(context); // login aafai pop hunxa
//             }
//           },
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Form(
//                 key: _key,
//                 child: Column(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                           backgroundColor: Colors.grey[300],
//                           context: context,
//                           isScrollControlled: true,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(20),
//                             ),
//                           ),
//                           builder: (context) => Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     checkCameraPermission();
//                                     _browseImage(ImageSource.camera);
//                                     Navigator.pop(context);
//                                   },
//                                   icon: const Icon(Icons.camera),
//                                   label: const Text('Camera'),
//                                 ),
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     _browseImage(ImageSource.gallery);
//                                     Navigator.pop(context);
//                                   },
//                                   icon: const Icon(Icons.image),
//                                   label: const Text('Gallery'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: _img != null
//                             ? FileImage(_img)
//                             : const AssetImage('assets/images/profile.png')
//                                 as ImageProvider,
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: const InputDecoration(labelText: 'Full Name'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter your full name' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _phoneController,
//                       decoration: const InputDecoration(labelText: 'Phone No'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter phone number' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(labelText: 'Email'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter email' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _addressController,
//                       decoration: const InputDecoration(labelText: 'Address'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter address' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _dobController,
//                       decoration:
//                           const InputDecoration(labelText: 'Date of Birth'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter DOB' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _genderController,
//                       decoration: const InputDecoration(labelText: 'Gender'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter gender' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(labelText: 'Password'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter password' : null,
//                     ),
//                     _gap,
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_key.currentState!.validate()) {
//                             final registerState =
//                                 context.read<RegisterBloc>().state;
//                             final imageName = registerState.imageName;
//                             context.read<RegisterBloc>().add(
//                                   RegisterStudent(
//                                     context: context,
//                                     name: _nameController.text,
//                                     phone: _phoneController.text,
//                                     username: _usernameController.text,
//                                     password: _passwordController.text,
//                                     email: _emailController.text,
//                                     address: _addressController.text,
//                                     dob: _dobController.text,
//                                     gender: _genderController.text,
//                                     image: imageName,
//                                   ),
//                                 );
//                           }
//                         },
//                         child: const Text('Register'),
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

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glow_nepal/core/common/snackbar/snackbar.dart'; // ✅ Import Snackbar for messages
// import 'package:glow_nepal/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final _gap = const SizedBox(height: 8);
//   final _key = GlobalKey<FormState>();

//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _dobController = TextEditingController();
//   final _genderController = TextEditingController();

//   File _img = File(''); // ✅ Empty file initialization

//   Future<void> checkCameraPermission() async {
//     if (await Permission.camera.request().isDenied) {
//       await Permission.camera.request();
//     }
//   }

//   Future<void> _browseImage(ImageSource imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource);
//       if (image != null) {
//         setState(() {
//           _img = File(image.path);
//         });

//         context
//             .read<RegisterBloc>()
//             .add(UploadImage(file: _img)); // ✅ Upload image
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Register'), centerTitle: true),
//       body: SafeArea(
//         // child: BlocListener<RegisterBloc, RegisterState>(
//         //   listener: (context, state) {
//         //     if (state.isSuccess) {
//         //       Navigator.pop(
//         //           context); // ✅ Navigate only after successful registration
//         //     }
//         //   },

//         child: BlocListener<RegisterBloc, RegisterState>(
//           listener: (context, state) {
//             if (state.isSuccess) {
//               // Navigator.pushReplacement(
//               //   context,
//               //   MaterialPageRoute(
//               //       builder: (context) => LoginView()), // ✅ Push Login Page
//               // );
//               Navigator.pop(context);
//             }
//           },
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Form(
//                 key: _key,
//                 child: Column(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                           backgroundColor: Colors.grey[300],
//                           context: context,
//                           isScrollControlled: true,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(20),
//                             ),
//                           ),
//                           builder: (context) => Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     checkCameraPermission();
//                                     _browseImage(ImageSource.camera);
//                                     Navigator.pop(context);
//                                   },
//                                   icon: const Icon(Icons.camera),
//                                   label: const Text('Camera'),
//                                 ),
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     _browseImage(ImageSource.gallery);
//                                     Navigator.pop(context);
//                                   },
//                                   icon: const Icon(Icons.image),
//                                   label: const Text('Gallery'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: _img.path.isNotEmpty
//                             ? FileImage(_img)
//                             : const AssetImage('assets/images/profile.png')
//                                 as ImageProvider,
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: const InputDecoration(labelText: 'Full Name'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter your full name' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _phoneController,
//                       decoration: const InputDecoration(labelText: 'Phone No'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter phone number' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(labelText: 'Email'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter email' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _addressController,
//                       decoration: const InputDecoration(labelText: 'Address'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter address' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _dobController,
//                       decoration:
//                           const InputDecoration(labelText: 'Date of Birth'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter DOB' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _genderController,
//                       decoration: const InputDecoration(labelText: 'Gender'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter gender' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _usernameController,
//                       decoration: const InputDecoration(labelText: 'Username'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter username' : null,
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(labelText: 'Password'),
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter password' : null,
//                     ),
//                     _gap,
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_key.currentState!.validate()) {
//                             final registerState =
//                                 context.read<RegisterBloc>().state;
//                             final imageName = registerState.imageName;

//                             if (imageName == null || imageName.isEmpty) {
//                               showMySnackBar(
//                                 context: context,
//                                 message: "Please upload an image",
//                                 color: Colors.red,
//                               );
//                               return;
//                             }

//                             context.read<RegisterBloc>().add(
//                                   RegisterStudent(
//                                     context: context,
//                                     name: _nameController.text,
//                                     phone: _phoneController.text,
//                                     username: _usernameController.text,
//                                     password: _passwordController.text,
//                                     email: _emailController.text,
//                                     address: _addressController.text,
//                                     dob: _dobController.text,
//                                     gender: _genderController.text,
//                                     image: imageName,
//                                   ),
//                                 );
//                           }
//                         },
//                         child: const Text('Register'),
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
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _key = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();

  File? _img;

  Future<void> checkCameraPermission() async {
    if (await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  Future<void> _browseImage(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image != null) {
      setState(() {
        _img = File(image.path);
      });

      context.read<RegisterBloc>().add(UploadImage(file: _img!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register'), centerTitle: true),
      body: SafeArea(
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.isSuccess && state.isImageUploaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text(
                        "Registration Successful! Navigating to Login...")),
              );

              // ✅ Navigate only when BOTH conditions are met
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.pop(context); // Navigate to login page
              });
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      checkCameraPermission();
                                      _browseImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.camera),
                                    label: const Text('Camera'),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _browseImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.image),
                                    label: const Text('Gallery'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _img != null
                              ? FileImage(_img!)
                              : const AssetImage('assets/images/profile.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Full Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter full name' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Phone No'),
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter phone number' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter email' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(labelText: 'Address'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter address' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _dobController,
                      decoration:
                          const InputDecoration(labelText: 'Date of Birth'),
                      validator: (value) => value!.isEmpty ? 'Enter DOB' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _genderController,
                      decoration: const InputDecoration(labelText: 'Gender'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter gender' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(labelText: 'UserName'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter User Name' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter password' : null,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: state.isLoading
                                ? null
                                : () {
                                    if (_key.currentState!.validate()) {
                                      if (state.imageName == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Please upload an image."),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      } else {
                                        context.read<RegisterBloc>().add(
                                              RegisterStudent(
                                                context: context,
                                                name: _nameController.text,
                                                phone: _phoneController.text,
                                                username:
                                                    _usernameController.text,
                                                password:
                                                    _passwordController.text,
                                                email: _emailController.text,
                                                address:
                                                    _addressController.text,
                                                dob: _dobController.text,
                                                gender: _genderController.text,
                                              ),
                                            );
                                      }
                                    }
                                  },
                            child: state.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text('Register'),
                          ),
                        );
                      },
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
