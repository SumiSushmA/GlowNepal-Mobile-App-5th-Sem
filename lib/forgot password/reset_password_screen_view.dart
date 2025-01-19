// import 'package:flutter/material.dart';

// class ResetPasswordScreenView extends StatelessWidget {
//   final TextEditingController newPasswordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   ResetPasswordScreenView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Reset Password")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Enter your new password",
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: newPasswordController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "New Password",
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: confirmPasswordController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "Confirm Password",
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Reset password logic here
//                 Navigator.popUntil(context, ModalRoute.withName('/login'));
//               },
//               child: const Text("Reset Password"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ResetPasswordScreenView extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ResetPasswordScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your new password",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: newPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "New Password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Confirm Password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Password reset logic (e.g., backend API call, etc.)
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login', // Navigate to the LoginScreen
                  (route) =>
                      false, // Removes all the previous routes from the stack
                );
              },
              child: const Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
