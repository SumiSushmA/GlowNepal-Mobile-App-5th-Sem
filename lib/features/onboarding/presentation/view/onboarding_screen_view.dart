import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/onboarding_cubit.dart';

class OnboardingScreenView extends StatelessWidget {
  const OnboardingScreenView({super.key});

  final List<Map<String, String>> onboardingData = const [
    {
      "image": "assets/images/onboarding1.jpg",
      "title": "✨ Welcome to GlowNepal! ✨",
      "description": "Your Beauty and Salon Experience, Simplified!"
    },
    {
      "image": "assets/images/onboarding2.jpg",
      "title": "Discover Salons and Services 🏠💖",
      "description":
          "Find a wide range of salons and beauty services near you. Whether it’s a haircut, manicure, or facial, explore the best options around."
    },
    {
      "image": "assets/images/onboarding3.jpg",
      "title": "Easy Appointment Booking 📅✨",
      "description":
          "Book your next beauty treatment in just a few taps. It's that simple!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return Scaffold(
            body: Stack(
              children: [
                // Background Image PageView
                PageView.builder(
                  controller: cubit.pageController,
                  onPageChanged: (index) =>
                      cubit.onPageChanged(index, onboardingData.length),
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      onboardingData[index]["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  },
                ),

                // Top Bar
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      if (state.currentIndex > 0)
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => cubit.pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                        )
                      else
                        const SizedBox(width: 48),

                      // Logo
                      Image.asset(
                        'assets/logos/glow-nepal-splash-logo.png',
                        width: 100,
                        height: 100,
                      ),

                      // Skip Button
                      TextButton(
                        onPressed: () =>
                            cubit.skipToLastPage(onboardingData.length),
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Title and Description
                Positioned(
                  bottom: 120,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          onboardingData[state.currentIndex]["title"]!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          onboardingData[state.currentIndex]["description"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Dots and Buttons
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Dots Indicator
                      Row(
                        children: List.generate(
                          onboardingData.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: state.currentIndex == index
                                  ? Colors.pink
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      // Next/Get Started Button
                      TextButton(
                        onPressed: state.isLastPage
                            ? () => cubit.navigateToLogin(context)
                            : cubit.nextPage,
                        child: Text(
                          state.isLastPage ? "Get Started" : "Next",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
