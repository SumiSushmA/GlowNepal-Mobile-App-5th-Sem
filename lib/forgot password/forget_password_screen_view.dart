// import 'package:flutter/material.dart';

// class ForgetPasswordScreenView extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();

//   ForgetPasswordScreenView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Forget Password")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Enter your email to reset your password",
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Email",
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Send OTP logic here
//                 Navigator.pushNamed(context, '/verification');
//               },
//               child: const Text("Send OTP"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ForgetPasswordScreenView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logos/glow-nepal-splash-logo.png', // Display logo
                width: 150, // Adjust width as needed
                height: 150, // Adjust height as needed
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Enter your email to reset your password",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to verification page
                Navigator.pushNamed(context, '/verification');
              },
              child: const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
