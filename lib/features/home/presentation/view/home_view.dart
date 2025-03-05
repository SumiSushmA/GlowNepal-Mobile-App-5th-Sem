// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/stylist_card.dart';

// import '../../data/model/stylist_model.dart';
// import '../view_model/stylist_cubit.dart';

// const Color primaryColor = Color(0xFFBB86FC);
// const Color secondaryColor = Color(0xFF6200EE);

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<StylistCubit>()..loadStylists(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Find Your Stylist"),
//           centerTitle: true,
//           backgroundColor: primaryColor,
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           hintText: "Search...",
//                           prefixIcon:
//                               const Icon(Icons.search, color: secondaryColor),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: secondaryColor, width: 2),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         "Special Offers",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: secondaryColor,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       SizedBox(
//                         height: 200,
//                         child: Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             PageView(
//                               controller: _pageController,
//                               onPageChanged: (index) {
//                                 setState(() {
//                                   _currentPage = index;
//                                 });
//                               },
//                               children: [
//                                 Image.asset("assets/images/banner.jpg",
//                                     fit: BoxFit.cover),
//                                 Image.asset("assets/images/banner1.jpg",
//                                     fit: BoxFit.cover),
//                                 Image.asset("assets/images/banner2.jpg",
//                                     fit: BoxFit.cover),
//                               ],
//                             ),
//                             Positioned(
//                               bottom: 10,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: List.generate(
//                                     3, (index) => _buildDot(index)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         "Categories",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: secondaryColor,
//                         ),
//                       ),
//                       Wrap(
//                         spacing: 10,
//                         children: [
//                           _categoryChip("Hair Stylist"),
//                           _categoryChip("Makeup Artist"),
//                           _categoryChip("Nail Technician"),
//                           _categoryChip("Facial & Skincare"),
//                           _categoryChip("Massage Therapist"),
//                           _categoryChip("Eyebrow & Lash Expert"),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         "Top Stylists",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: secondaryColor,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   ),
//                 ),
//                 BlocBuilder<StylistCubit, List<StylistModel>>(
//                   builder: (context, stylists) {
//                     if (stylists.isEmpty) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                           childAspectRatio: 0.6,
//                         ),
//                         itemCount: stylists.length,
//                         itemBuilder: (context, index) {
//                           final stylist = stylists[index];
//                           return StylistCard(stylist: stylist);
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _categoryChip(String label) {
//     return Chip(
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.white),
//       ),
//       backgroundColor: primaryColor,
//     );
//   }

//   Widget _buildDot(int index) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       width: _currentPage == index ? 10 : 8,
//       height: _currentPage == index ? 10 : 8,
//       decoration: BoxDecoration(
//         color: _currentPage == index ? secondaryColor : Colors.grey,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/login_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/stylist_card.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/stylist_cubit.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color primaryColor = Color(0xFFBB86FC);
const Color secondaryColor = Color(0xFF6200EE);

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  StreamSubscription? _gyroscopeSubscription;

  @override
  void initState() {
    super.initState();
    _startGyroscopeListener();
  }

  /// **Start Gyroscope Listener**
  void _startGyroscopeListener() {
    _gyroscopeSubscription = gyroscopeEvents.listen((event) {
      // Flip detection: strong movement on x-axis
      if (event.x.abs() > 5.0) {
        _confirmLogout();
      }
    });
  }

  /// **Logout Confirmation Dialog**
  Future<void> _confirmLogout() async {
    if (!context.mounted) return;

    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("You flipped your phone! Do you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext, true);
              final sharedPrefs = await SharedPreferences.getInstance();
              await sharedPrefs.remove('token'); // Remove session

              // ✅ Ensure LoginBloc is provided
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
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _gyroscopeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StylistCubit>()..loadStylists(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Find Your Stylist"),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          prefixIcon:
                              const Icon(Icons.search, color: secondaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: secondaryColor, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Special Offers",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            PageView(
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              children: [
                                Image.asset("assets/images/banner.jpg",
                                    fit: BoxFit.cover),
                                Image.asset("assets/images/banner1.jpg",
                                    fit: BoxFit.cover),
                                Image.asset("assets/images/banner2.jpg",
                                    fit: BoxFit.cover),
                              ],
                            ),
                            Positioned(
                              bottom: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    3, (index) => _buildDot(index)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        children: [
                          _categoryChip("Hair Stylist"),
                          _categoryChip("Makeup Artist"),
                          _categoryChip("Nail Technician"),
                          _categoryChip("Facial & Skincare"),
                          _categoryChip("Massage Therapist"),
                          _categoryChip("Eyebrow & Lash Expert"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Top Stylists",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                BlocBuilder<StylistCubit, List<StylistModel>>(
                  builder: (context, stylists) {
                    if (stylists.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: stylists.length,
                        itemBuilder: (context, index) {
                          final stylist = stylists[index];
                          return StylistCard(stylist: stylist);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: primaryColor,
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 10 : 8,
      height: _currentPage == index ? 10 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? secondaryColor : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
