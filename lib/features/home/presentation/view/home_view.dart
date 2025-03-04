// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';

// import '../../data/model/stylist_model.dart';
// import '../view_model/stylist_cubit.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<StylistCubit>()..loadStylists(),
//       child: Scaffold(
//         appBar: AppBar(title: Text("Top Stylists to Book")),
//         body: BlocBuilder<StylistCubit, List<StylistModel>>(
//           builder: (context, stylists) {
//             return ListView.builder(
//               itemCount: stylists.length,
//               itemBuilder: (context, index) {
//                 final stylist = stylists[index];
//                 return ListTile(
//                   leading: Image.network(stylist.image),
//                   title: Text(stylist.name),
//                   subtitle: Text(stylist.category),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';

// import '../../data/model/stylist_model.dart';
// import '../view_model/stylist_cubit.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<StylistCubit>()..loadStylists(),
//       child: Scaffold(
//         appBar: AppBar(title: Text("Top Stylists to Book")),
//         body: BlocBuilder<StylistCubit, List<StylistModel>>(
//           builder: (context, stylists) {
//             if (stylists.isEmpty) {
//               return Center(child: CircularProgressIndicator());
//             }

//             return ListView.builder(
//               itemCount: stylists.length,
//               itemBuilder: (context, index) {
//                 final stylist = stylists[index];

//                 return ListTile(
//                   leading: stylist.image.isNotEmpty
//                       ? Image.network(stylist.image,
//                           width: 50, height: 50, fit: BoxFit.cover)
//                       : Icon(Icons.person, size: 50), // Fallback icon
//                   title: Text(stylist.name),
//                   subtitle: Text(stylist.category),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';

// import '../../data/model/stylist_model.dart';
// import '../view_model/stylist_cubit.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<StylistCubit>()
//         ..loadStylists(), // ✅ Properly initializing StylistCubit
//       child: Scaffold(
//         appBar: AppBar(title: const Text("Top Stylists to Book")),
//         body: BlocBuilder<StylistCubit, List<StylistModel>>(
//           builder: (context, stylists) {
//             if (stylists.isEmpty) {
//               return const Center(
//                 child: CircularProgressIndicator(), // ✅ Show loading spinner
//               );
//             }

//             return ListView.builder(
//               itemCount: stylists.length,
//               itemBuilder: (context, index) {
//                 final stylist = stylists[index];
//                 return ListTile(
//                   leading: Image.network(
//                     stylist.image,
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return const Center(child: CircularProgressIndicator());
//                     },
//                     errorBuilder: (context, error, stackTrace) {
//                       return const Icon(Icons
//                           .image_not_supported); // ✅ Handles missing images
//                     },
//                   ),
//                   title: Text(stylist.name),
//                   subtitle: Text(stylist.category),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/stylist_card.dart';

import '../../data/model/stylist_model.dart';
import '../view_model/stylist_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StylistCubit>()..loadStylists(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Find Your Stylist"),
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
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Special Offers",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                                Image.asset("assets/images/banner.jpg", fit: BoxFit.cover),
                                Image.asset("assets/images/banner1.jpg", fit: BoxFit.cover),
                                Image.asset("assets/images/banner2.jpg", fit: BoxFit.cover),
                              ],
                            ),
                            Positioned(
                              bottom: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (index) => _buildDot(index)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Categories",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                      const Text(
                        "Top Stylists",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                          childAspectRatio: 0.6, // Increased size to better fit content
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
      label: Text(label),
      backgroundColor: Colors.purple.shade100,
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 10 : 8,
      height: _currentPage == index ? 10 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.purple : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
