import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
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

  void _goToHome() {
    Navigator.pushReplacementNamed(
        context, '/start screen'); // Navigate to the home page
  }

  void _skipToLastPage() {
    _controller.jumpToPage(2); // Jump directly to the third page (index 2)
  }

  void _goBack() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen Image (Background)
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _onboardingData[index]["image"]!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // Top Bar with Logo, Back Button, and Skip Button
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Arrow (Hidden on the first page)
                if (_currentIndex > 0)
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.black, size: 30),
                    onPressed: _goBack,
                  )
                else
                  const SizedBox(width: 48), // Placeholder for alignment

                // Logo (Centered)
                Image.asset(
                  'assets/logos/glow-nepal-splash-logo.png',
                  width: 100, // Adjust logo size
                  height: 100,
                ),

                // Skip Button (Top Right)
                TextButton(
                  onPressed: _skipToLastPage,
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18, // Adjusted size for better visibility
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Content with Title and Description in Transparent Background
          Positioned(
            bottom: 100, // Adjusted to move content above the Next button
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black
                    .withOpacity(0.5), // Semi-transparent background
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _onboardingData[_currentIndex]["title"]!,
                    style: const TextStyle(
                      fontSize: 28, // Larger title font
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for visibility
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _onboardingData[_currentIndex]["description"]!,
                    style: const TextStyle(
                      fontSize: 18, // Description text
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Bottom Dots and Next Button
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
                    _onboardingData.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            _currentIndex == index ? Colors.pink : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                // Next or Get Started Button
                TextButton(
                  onPressed: () {
                    if (_currentIndex == _onboardingData.length - 1) {
                      _goToHome(); // On the last page, navigate to home
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentIndex == _onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Black button text
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
