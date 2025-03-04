import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';

class StylistDetailsPage extends StatelessWidget {
  final StylistModel stylist;
  const StylistDetailsPage({super.key, required this.stylist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stylist Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(stylist.image),
                radius: 80, // Increased image size
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    stylist.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text("${stylist.experience} years experience",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailCard(
                context, "About", stylist.about ?? "No description available"),
            const SizedBox(height: 20),
            _buildDetailCard(context, "Specialization", stylist.category),
            const SizedBox(height: 20),
            _buildDetailCard(context, "Booking Fee", "\$${stylist.bookingFee}"),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(BuildContext context, String title, String content) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(content, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
