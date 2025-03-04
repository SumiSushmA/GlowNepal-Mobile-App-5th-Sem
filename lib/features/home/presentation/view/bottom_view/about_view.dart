import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFBB86FC);
const Color secondaryColor = Color(0xFF6200EE);

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/about_image.png',
                              width: constraints.maxWidth * 0.4,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome to GlowNepal, your trusted beauty and salon appointment booking platform...",
                                style:
                                    TextStyle(fontSize: 16, color: textColor),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Our Vision",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                ),
                              ),
                              Text(
                                "Our vision at GlowNepal is to revolutionize the beauty and wellness industry by making expert services more accessible...",
                                style:
                                    TextStyle(fontSize: 16, color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "WHY CHOOSE US",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _buildHoverCard(
                            "EFFICIENCY",
                            "Seamless online booking with instant appointment confirmation.",
                            isDarkMode),
                        _buildHoverCard(
                            "CONVENIENCE",
                            "Find top-rated beauty professionals near you and book appointments at your preferred time.",
                            isDarkMode),
                        _buildHoverCard(
                            "PERSONALIZATION",
                            "Receive tailored beauty service recommendations based on your preferences.",
                            isDarkMode),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoverCard(String title, String description, bool isDarkMode) {
    return MouseRegion(
      onEnter: (event) => {},
      onExit: (event) => {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 200,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode ? Colors.black : Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
