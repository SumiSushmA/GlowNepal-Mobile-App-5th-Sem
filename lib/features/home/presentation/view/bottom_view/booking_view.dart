import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/login_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_state.dart';
import 'package:glownepal_mobile_app_5th_sem/sensor/shake_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color primaryColor = Color(0xFFBB86FC);
const Color secondaryColor = Color(0xFF6200EE);
const Color backgroundColor = Color(0xFFF3E5F5);

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShakeDetector(
      onShake: () => _confirmLogout(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Booking Records"),
              centerTitle: true,
              backgroundColor: primaryColor,
              foregroundColor: Colors.black,
            ),
            backgroundColor: backgroundColor,
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
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(booking["imageUrl"]),
                              radius: 35,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Stylist: ${booking["stylist"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Date: ${booking["day"]}, ${booking["date"]} | Time: ${booking["time"]}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red, size: 24),
                                  onPressed: () {
                                    context
                                        .read<HomeCubit>()
                                        .deleteBooking(index);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Appointment Deleted"),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context) async {
    if (!context.mounted) return;
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext, true);
              final sharedPrefs = await SharedPreferences.getInstance();
              await sharedPrefs.remove('token');

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => getIt<LoginBloc>(),
                    child: LoginView(),
                  ),
                ),
              );
            },
            child: const Text("Yes", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/login_view.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_state.dart';
// import 'package:glownepal_mobile_app_5th_sem/sensor/shake_detector.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// const Color primaryColor = Color(0xFFBB86FC);
// const Color secondaryColor = Color(0xFF6200EE);
// const Color backgroundColor = Color(0xFFF3E5F5);

// class BookingView extends StatelessWidget {
//   const BookingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ShakeDetector(
//       onShake: () => _confirmLogout(context),
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text("Booking Records"),
//               centerTitle: true,
//               backgroundColor: primaryColor,
//               foregroundColor: Colors.black,
//             ),
//             backgroundColor: backgroundColor,
//             body: state.bookings.isEmpty
//                 ? const Center(
//                     child: Text(
//                       "No bookings yet.",
//                       style: TextStyle(fontSize: 18, color: secondaryColor),
//                     ),
//                   )
//                 : ListView.builder(
//                     padding: const EdgeInsets.all(16.0),
//                     itemCount: state.bookings.length,
//                     itemBuilder: (context, index) {
//                       final booking = state.bookings[index];
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 12),
//                         padding: const EdgeInsets.all(14),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 6,
//                               offset: Offset(0, 3),
//                             )
//                           ],
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             CircleAvatar(
//                               backgroundImage:
//                                   NetworkImage(booking["imageUrl"]),
//                               radius: 35,
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Stylist: ${booking["stylist"]}",
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                         color: Colors.black),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     "Date: ${booking["day"]}, ${booking["date"]} | Time: ${booking["time"]}",
//                                     style: const TextStyle(
//                                         fontSize: 14, color: Colors.black54),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.edit,
//                                       color: Colors.blue, size: 24),
//                                   onPressed: () => _editBooking(context, index),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.delete,
//                                       color: Colors.red, size: 24),
//                                   onPressed: () {
//                                     context
//                                         .read<HomeCubit>()
//                                         .deleteBooking(index);
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                         content: Text("Appointment Deleted"),
//                                         duration: Duration(seconds: 2),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//           );
//         },
//       ),
//     );
//   }

//   Future<void> _confirmLogout(BuildContext context) async {
//     if (!context.mounted) return;
//     final shouldLogout = await showDialog<bool>(
//       context: context,
//       builder: (dialogContext) => AlertDialog(
//         title: const Text("Logout"),
//         content: const Text("Are you sure you want to logout?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(dialogContext, false),
//             child: const Text("No"),
//           ),
//           TextButton(
//             onPressed: () async {
//               Navigator.pop(dialogContext, true);
//               final sharedPrefs = await SharedPreferences.getInstance();
//               await sharedPrefs.remove('token');

//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BlocProvider(
//                     create: (context) => getIt<LoginBloc>(),
//                     child: LoginView(),
//                   ),
//                 ),
//               );
//             },
//             child: const Text("Yes", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _editBooking(BuildContext context, int index) async {
//     final booking = context.read<HomeCubit>().state.bookings[index];
//     final stylistController = TextEditingController(text: booking["stylist"]);
//     final dateController = TextEditingController(text: booking["date"]);
//     final timeController = TextEditingController(text: booking["time"]);
//     final dayController = TextEditingController(text: booking["day"]);
//     final imageUrlController = TextEditingController(text: booking["imageUrl"]);

//     final updatedBooking = await showDialog<Map<String, dynamic>>(
//       context: context,
//       builder: (dialogContext) => AlertDialog(
//         title: const Text("Edit Booking"),
//         content: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextField(
//                 controller: stylistController,
//                 decoration: const InputDecoration(labelText: "Stylist"),
//               ),
//               TextField(
//                 controller: dateController,
//                 decoration: const InputDecoration(labelText: "Date"),
//               ),
//               TextField(
//                 controller: timeController,
//                 decoration: const InputDecoration(labelText: "Time"),
//               ),
//               TextField(
//                 controller: dayController,
//                 decoration: const InputDecoration(labelText: "Day"),
//               ),
//               TextField(
//                 controller: imageUrlController,
//                 decoration: const InputDecoration(labelText: "Image URL"),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(dialogContext),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () {
//               final updatedBooking = {
//                 "stylist": stylistController.text,
//                 "date": dateController.text,
//                 "time": timeController.text,
//                 "day": dayController.text,
//                 "imageUrl": imageUrlController.text,
//               };
//               Navigator.pop(dialogContext, updatedBooking);
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );

//     if (updatedBooking != null) {
//       context.read<HomeCubit>().editBooking(index, updatedBooking);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Booking Updated"),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }
// }
