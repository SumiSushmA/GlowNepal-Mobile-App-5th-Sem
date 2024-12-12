// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:glownepal_mobile_app_5th_sem/onboarding/onboarding_screen_view.dart'; // For Timer

// class SplashScreenView extends StatefulWidget {
//   const SplashScreenView({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreenView> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(const Duration(seconds: 6), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const OnboardingScreen(),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFFFFD6F3), // Light pink shade
//               Color(0xFFB5B2FE), // Light purple shade
//             ],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Increased Logo Size
//               Container(
//                 height: 400,
//                 width: 400,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                 ),
//                 child: Image.asset(
//                   'assets/logos/glow-nepal-splash-logo.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // App Title

//               const Text(
//                 'GlowNepal',
//                 style: TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 10.0,
//                       color: Colors.black26,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // Subtitle
//               const Text(
//                 'BEAUTY APP',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                   letterSpacing: 2.0,
//                   color: Colors.white,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 5.0,
//                       color: Colors.black26,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NextScreen extends StatelessWidget {
//   const NextScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           'Welcome to GlowNepal!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:glownepal_mobile_app_5th_sem/onboarding/onboarding_screen_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreenView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFD6F3), // Light pink shade
              Color(0xFFB5B2FE), // Light purple shade
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                height: 400,
                width: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logos/glow-nepal-splash-logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // App Title
              const Text(
                'GlowNepal',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black26,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              const Text(
                'BEAUTY APP',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.0,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black26,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
