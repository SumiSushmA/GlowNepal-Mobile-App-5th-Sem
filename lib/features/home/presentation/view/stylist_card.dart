import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/appointment_booking.dart';

class StylistCard extends StatelessWidget {
  final StylistModel stylist;
  const StylistCard({super.key, required this.stylist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppointmentBooking(stylist: stylist),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                stylist.image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 50);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    stylist.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    stylist
                        .speciality, // ✅ FIXED: Use `speciality` instead of `category`
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AppointmentBooking(stylist: stylist),
                        ),
                      );
                    },
                    child: const Text("Book Now"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
