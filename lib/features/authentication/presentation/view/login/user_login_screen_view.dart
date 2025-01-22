import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/local_datasource/user_signup_local_datasource.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/repository/user_signup_data_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/use_case/signup/user_signup_usecases.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view/signup/user_signup_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/signup/user_signup_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/home_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserLoginScreenView extends StatefulWidget {
  const UserLoginScreenView({super.key});

  @override
  _UserLoginScreenViewState createState() => _UserLoginScreenViewState();
}

class _UserLoginScreenViewState extends State<UserLoginScreenView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      final box = Hive.box('userSignupBox');
      final user = box.get(email);

      if (user != null && user['password'] == password) {
        // Login success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logged in successfully')),
        );

        // Navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        _showErrorMessage('Invalid email or password');
      }
    } else {
      _showErrorMessage('Please fill in both fields');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFEDEE0),
                Color(0xFFD6E5FA),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60), // Space above the logo
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage('assets/logos/glow-nepal-splash-logo.png'),
                ),
                const SizedBox(height: 16), // Space between logo and text
                const Text(
                  'GlowNepal',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Effortless appointments for flawless looks.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40), // Space before Login text
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                    height: 30), // Space before email/password fields
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
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
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Space before the login button
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    minimumSize: Size(MediaQuery.of(context).size.width,
                        60), // Full width, larger height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const Spacer(), // Push the footer text to the bottom
                Column(
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => UserSignupBloc(
                                SignupUseCase(
                                  UserSignupDataRepositoryImpl(
                                      UserSignupLocalDatasource(HiveService(
                                    userLoginBox: Hive.box('userLoginBox'),
                                    userSignupBox: Hive.box('userSignupBox'),
                                  ))),
                                ),
                              ),
                              child: const UserSignupScreenView(),
                            ),
                          ),
                        );
                      },
                      child: const Text('Create an Account'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
