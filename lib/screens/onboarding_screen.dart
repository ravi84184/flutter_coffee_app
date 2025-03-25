import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo and title
              Column(
                children: [
                  Image.asset(
                    'assets/images/coffee_logo.png',
                    height: 40,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'COFFEE TASTE!',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Color(0xFF2F2D2C),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1),
              // Coffee illustration
              Image.asset(
                'assets/images/coffee_illustration.png',
                height: 280,
              ),
              const Spacer(flex: 1),
              // Text content
              const Column(
                children: [
                  Text(
                    'Find your favorite',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2F2D2C),
                    ),
                  ),
                  Text(
                    'Coffee Taste!',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2F2D2C),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We\'re coffee shop, beer and wine bar,\n& event space for performing arts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: Color(0xFF9B9B9B),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Get Started button
              Container(
                width: double.infinity,
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xFF6B4731),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to home screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Page indicator
              Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF6B4731),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
