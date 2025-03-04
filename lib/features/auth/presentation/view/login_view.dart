import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/register_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/main_home_view.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController(text: 'sushma@gmail.com');
  final _passwordController = TextEditingController(text: 'sushma123');

  final _gap = const SizedBox(height: 16);

  static const Color primaryColor = Color(0xFFBB86FC);
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
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isSuccess) {
                Navigator.pushReplacement(
                  context,
                  // MaterialPageRoute(builder: (context) => HomeView()),
                  MaterialPageRoute(builder: (context) => MainHomeView()),
                );
              }
            },
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: LoginView.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: widget._formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/logos/glow-nepal-splash-logo.png',
                          height: 200),
                      const Text('Welcome Back!',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: LoginView.primaryColor)),
                      widget._gap,
                      TextFormField(
                        controller: widget._email,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email,
                              color: LoginView.primaryColor),
                          labelText: 'Email',
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter email' : null,
                      ),
                      widget._gap,
                      TextFormField(
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
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter password' : null,
                      ),
                      widget._gap,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: LoginView.primaryColor),
                          onPressed: () {
                            if (widget._formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                    LoginStudentEvent(
                                      context: context,
                                      email: widget._email.text,
                                      password: widget._passwordController.text,
                                    ),
                                  );
                            }
                          },
                          child: const Text('Login',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
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
                            style: TextStyle(color: LoginView.primaryColor)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
