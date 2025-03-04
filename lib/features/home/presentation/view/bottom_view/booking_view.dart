// // Booking View
// import 'package:flutter/material.dart';

// class BookingView extends StatelessWidget {
//   const BookingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Booking")),
//       body: const Center(
//         child: Text(
//           "📅 Booking Screen",
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class BookingView extends StatelessWidget {
//   final List<Map<String, dynamic>> bookings;
//   const BookingView({super.key, required this.bookings});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Booking Records")),
//       body: bookings.isEmpty
//           ? const Center(
//               child: Text("No bookings yet.", style: TextStyle(fontSize: 18)),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(16.0),
//               itemCount: bookings.length,
//               itemBuilder: (context, index) {
//                 final booking = bookings[index];
//                 return Card(
//                   child: ListTile(
//                     title: Text("Stylist: ${booking["stylist"]}"),
//                     subtitle: Text(
//                         "Date: ${booking["day"]}, ${booking["date"]} | Time: ${booking["time"]}"),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class BookingView extends StatelessWidget {
//   final List<Map<String, dynamic>> bookings; // Accept bookings parameter

//   const BookingView({super.key, required this.bookings});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Booking Records")),
//       body: bookings.isEmpty
//           ? const Center(
//               child: Text("No bookings yet.", style: TextStyle(fontSize: 18)),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(16.0),
//               itemCount: bookings.length,
//               itemBuilder: (context, index) {
//                 final booking = bookings[index];
//                 return Card(
//                   child: ListTile(
//                     title: Text("Stylist: ${booking["stylist"]}"),
//                     subtitle: Text(
//                         "Date: ${booking["day"]}, ${booking["date"]} | Time: ${booking["time"]}"),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_state.dart';

// const Color primaryColor = Color(0xFFBB86FC);
// const Color secondaryColor = Color(0xFF6200EE);

// class BookingView extends StatelessWidget {
//   const BookingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("Booking Records"),
//             backgroundColor: primaryColor,
//             foregroundColor: Colors.white,
//           ),
//           body: state.bookings.isEmpty
//               ? const Center(
//                   child: Text("No bookings yet.",
//                       style: TextStyle(fontSize: 18, color: secondaryColor)),
//                 )
//               : ListView.builder(
//                   padding: const EdgeInsets.all(16.0),
//                   itemCount: state.bookings.length,
//                   itemBuilder: (context, index) {
//                     final booking = state.bookings[index];
//                     return Card(
//                       color: primaryColor.withOpacity(0.2),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(booking["imageUrl"]),
//                         ),
//                         title: Text("Stylist: ${booking["stylist"]}"),
//                         subtitle: Text(
//                             "Date: ${booking["day"]}, ${booking["date"]} | Time: ${booking["time"]}"),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             /// Edit Button
//                             IconButton(
//                               icon: Icon(Icons.edit, color: secondaryColor),
//                               onPressed: () {
//                                 _showEditDialog(context, index, booking);
//                               },
//                             ),

//                             /// Delete Button
//                             IconButton(
//                               icon: Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 context.read<HomeCubit>().deleteBooking(index);
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text("Appointment Deleted"),
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//         );
//       },
//     );
//   }

//   /// **Show Edit Dialog**
//   void _showEditDialog(
//       BuildContext context, int index, Map<String, dynamic> booking) {
//     TextEditingController stylistController =
//         TextEditingController(text: booking["stylist"]);
//     TextEditingController dateController =
//         TextEditingController(text: booking["date"]);
//     TextEditingController timeController =
//         TextEditingController(text: booking["time"]);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Appointment"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: stylistController,
//                 decoration: const InputDecoration(labelText: "Stylist Name"),
//               ),
//               TextField(
//                 controller: dateController,
//                 decoration: const InputDecoration(labelText: "Date"),
//               ),
//               TextField(
//                 controller: timeController,
//                 decoration: const InputDecoration(labelText: "Time"),
//               ),
//             ],
//           ),
//           actions: [
//             /// Cancel Button
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),

//             /// Save Button
//             TextButton(
//               onPressed: () {
//                 final updatedBooking = {
//                   "stylist": stylistController.text,
//                   "date": dateController.text,
//                   "day": booking["day"], // Keep the day unchanged
//                   "time": timeController.text,
//                   "imageUrl": booking["imageUrl"], // Keep image URL
//                 };

//                 context.read<HomeCubit>().editBooking(index, updatedBooking);

//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("Appointment Updated"),
//                     duration: Duration(seconds: 2),
//                   ),
//                 );

//                 Navigator.pop(context);
//               },
//               child: const Text("Save"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_state.dart';

const Color primaryColor = Color(0xFFBB86FC);
const Color secondaryColor = Color(0xFF6200EE);

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Booking Records"),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
          body: state.bookings.isEmpty
              ? const Center(
                  child: Text(
                    "No bookings yet.",
                    style: TextStyle(fontSize: 18, color: secondaryColor),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.bookings.length,
                  itemBuilder: (context, index) {
                    final booking = state.bookings[index];
                    return Card(
                      color: primaryColor.withOpacity(0.2),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(booking["imageUrl"]),
                        ),
                        title: Text("Stylist: ${booking["stylist"]}"),
                        subtitle: Text(
                            "Date: ${booking["day"]}, ${booking["date"]} | Time: ${booking["time"]}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// Edit Button
                            IconButton(
                              icon: Icon(Icons.edit, color: secondaryColor),
                              onPressed: () {
                                _showEditDialog(context, index, booking);
                              },
                            ),

                            /// Delete Button
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                context.read<HomeCubit>().deleteBooking(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Appointment Deleted"),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }

  /// **Show Edit Dialog**
  void _showEditDialog(
      BuildContext context, int index, Map<String, dynamic> booking) {
    TextEditingController stylistController =
        TextEditingController(text: booking["stylist"]);
    TextEditingController dateController =
        TextEditingController(text: booking["date"]);
    TextEditingController timeController =
        TextEditingController(text: booking["time"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Appointment"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: stylistController,
                decoration: const InputDecoration(labelText: "Stylist Name"),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: "Date"),
              ),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(labelText: "Time"),
              ),
            ],
          ),
          actions: [
            /// Cancel Button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            /// Save Button
            TextButton(
              onPressed: () {
                final updatedBooking = {
                  "stylist": stylistController.text,
                  "date": dateController.text,
                  "day": booking["day"], // Keep the day unchanged
                  "time": timeController.text,
                  "imageUrl": booking["imageUrl"], // Keep image URL
                };

                context.read<HomeCubit>().editBooking(index, updatedBooking);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Appointment Updated"),
                    duration: Duration(seconds: 2),
                  ),
                );

                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
