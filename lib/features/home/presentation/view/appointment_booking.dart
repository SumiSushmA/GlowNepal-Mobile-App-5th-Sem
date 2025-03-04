import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/stylist_detail_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';

const Color primaryColor = Color(0xFFBB86FC);
const Color secondaryColor = Color(0xFF6200EE);

class AppointmentBooking extends StatefulWidget {
  final StylistModel stylist;
  const AppointmentBooking({super.key, required this.stylist});

  @override
  _AppointmentBookingState createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  final List<Map<String, String>> availableDates = [
    {"day": "Sun", "date": "13"},
    {"day": "Mon", "date": "14"},
    {"day": "Tue", "date": "15"},
    {"day": "Wed", "date": "16"},
  ];

  final List<String> availableTimes = [
    "7:00 AM",
    "8:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM"
  ];

  void _bookAppointment() {
    if (selectedDateIndex >= 0 && selectedTimeIndex >= 0) {
      final appointment = {
        "stylist": widget.stylist.name,
        "date": availableDates[selectedDateIndex]["date"],
        "day": availableDates[selectedDateIndex]["day"],
        "time": availableTimes[selectedTimeIndex],
        "imageUrl": widget.stylist.image,
      };

      context.read<HomeCubit>().addBooking(appointment);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Appointment Booking Completed"),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Appointment",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Stylist Info with "See More" Button
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.stylist.image),
                    radius: 30,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.stylist.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text("\$${widget.stylist.bookingFee}/hr",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StylistDetailsPage(stylist: widget.stylist),
                        ),
                      );
                    },
                    child: const Text("See More",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// Choose Date Section
            const Text("Choose Date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(availableDates.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDateIndex = index;
                    });
                  },
                  child: _dateWidget(
                      availableDates[index]["day"]!,
                      availableDates[index]["date"]!,
                      index == selectedDateIndex),
                );
              }),
            ),
            const SizedBox(height: 20),

            /// Choose Time Section
            const Text("Choose Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(availableTimes.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTimeIndex = index;
                    });
                  },
                  child: _timeWidget(
                      availableTimes[index], index == selectedTimeIndex),
                );
              }),
            ),
            const Spacer(),

            /// Checkout Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(double.infinity, 50)),
              onPressed: _bookAppointment,
              child: const Text("Checkout",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateWidget(String day, String date, bool isSelected) {
    return Column(
      children: [
        Text(day, style: TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Text(date,
              style: TextStyle(
                  fontSize: 18,
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _timeWidget(String time, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)),
      child: Text(time,
          style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold)),
    );
  }
}
