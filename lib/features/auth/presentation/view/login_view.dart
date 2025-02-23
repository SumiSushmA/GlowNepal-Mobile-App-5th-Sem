// //navigation garda error aako code
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/register_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/home_view.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController(text: 'sushma@gmail.com');
  final _passwordController = TextEditingController(text: 'sushma123');

  final _gap = const SizedBox(height: 16);

  static const Color primaryColor = Color(0xFFBB86FC);
  static const Color secondaryColor = Color(0xFF6200EE);
  static const Color backgroundColor = Color(0xFFEDE7F6);

  bool _isPasswordVisible = false;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: LoginView.backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: widget._formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset('assets/logos/glow-nepal-splash-logo.png',
                        height: 200),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: LoginView.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: widget._email,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email,
                            color: LoginView.primaryColor),
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.black87),
                    ),
                    widget._gap,
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: widget._passwordController,
                      obscureText: !widget._isPasswordVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock,
                            color: LoginView.primaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            widget._isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: LoginView.primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              widget._isPasswordVisible =
                                  !widget._isPasswordVisible;
                            });
                          },
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                      style: const TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LoginView.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () async {
                          if (widget._formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                                  LoginStudentEvent(
                                    context: context,
                                    email: widget._email.text,
                                    password: widget._passwordController.text,
                                  ),
                                );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              NavigateRegisterScreenEvent(
                                destination: RegisterView(),
                                context: context,
                              ),
                            );
                      },
                      child: const Text(
                        'Don\'t have an account? Register here',
                        style: TextStyle(
                          color: LoginView.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
