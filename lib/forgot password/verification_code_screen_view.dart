// import 'package:flutter/material.dart';

// class VerificationCodeScreenView extends StatelessWidget {
//   final TextEditingController otpController = TextEditingController();

//   VerificationCodeScreenView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Verify OTP")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Enter the verification code sent to your email",
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: otpController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: "OTP",
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Verify OTP logic here
//                 Navigator.pushNamed(context, '/reset-password');
//               },
//               child: const Text("Verify"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class VerificationCodeScreenView extends StatelessWidget {
  final List<TextEditingController> otpControllers =
      List.generate(6, (_) => TextEditingController());

  VerificationCodeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centering the content vertically
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Enter the verification code sent to your email",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), // Space between the text and OTP fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Space between boxes
                  child: SizedBox(
                    width: 40,
                    child: TextField(
                      controller: otpControllers[index],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      obscureText: false, // Ensure text is visible
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(
                height: 40), // Space between OTP fields and the "Verify" button
            ElevatedButton(
              onPressed: () {
                // Simulate OTP check (e.g., OTP is 123456)
                String otp = otpControllers
                    .map((controller) => controller.text)
                    .join('');
                if (otp == '123456') {
                  Navigator.pushNamed(context, '/reset-password');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid OTP!')),
                  );
                }
              },
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
