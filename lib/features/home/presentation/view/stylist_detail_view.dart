import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';

const Color primaryColor = Color(0xFFBB86FC);
const Color secondaryColor = Color(0xFF6200EE);
const Color backgroundColor = Color(0xFFF3E5F5); // Lighter purple for contrast

class StylistDetailsPage extends StatelessWidget {
  final StylistModel stylist;
  const StylistDetailsPage({super.key, required this.stylist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // Softer Background Color
      appBar: AppBar(
        title: const Text("Stylist Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// **Stylist Image**
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(stylist.image),
                radius: 65, // Larger & More Defined
              ),
            ),
            const SizedBox(height: 15),

            /// **Stylist Name & Experience**
            Text(
              stylist.name,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              "${stylist.experience} Years Experience",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 25),

            /// **Details in a Row with Better Spacing**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildDetailCard("About", stylist.about),
                ),
                const SizedBox(width: 10), // Space between cards
                Expanded(
                  child: _buildDetailCard(
                      "Specialization", stylist.speciality), // FIXED
                ),
                const SizedBox(width: 10), // Space between cards
                Expanded(
                  child: _buildDetailCard(
                      "Booking Fee", "\$${stylist.bookingFee}/hr"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// **Book Appointment Button - More Visible**
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Book Appointment",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white, // Better contrast
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: secondaryColor),
          ),
          const SizedBox(height: 5),
          Text(content,
              style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }
}
