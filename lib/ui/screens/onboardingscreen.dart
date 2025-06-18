import 'package:flutter/material.dart';
import 'package:toursl/models/onboarddata.dart';
import 'package:toursl/ui/screens/home.dart';
import 'package:toursl/ui/widgets/onboardpage.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<OnboardData> pages = [
    OnboardData(
      image: 'assets/ON1.png',
      title: 'Explore Sri Lanka',
      description: 'Discover rich culture and scenic beauty around the island.',
    ),
    OnboardData(
      image: 'assets/ON2.png',
      title: 'Find Hidden Gems',
      description: 'Uncover hidden waterfalls, temples and heritage sites.',
    ),
    OnboardData(
      image: 'assets/ON3.png',
      title: 'Plan Your Trip',
      description: 'Bookmark locations and prepare your journey easily.',
    ),
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    } else {
      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
    }
  }

  Widget buildDot(int index) {
    return Container(
      height: 10,
      width: currentPage == index ? 22 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF057D54)
            : const Color(0xFFB2D8C2),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF8F1),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => currentPage = index),
              itemCount: pages.length,
              itemBuilder: (context, index) => OnboardPage(data: pages[index]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pages.length, buildDot),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF057D54),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                currentPage == pages.length - 1 ? 'Get Started' : 'Next',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
