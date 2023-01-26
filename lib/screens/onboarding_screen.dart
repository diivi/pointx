import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 3 slides with title, subtitle and a lottie animation
    return Scaffold(
      backgroundColor: const Color.fromRGBO(113, 99, 186, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onboardingData.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContent(
                  lottieLink: onboardingData[index].lottieLink,
                  title: onboardingData[index].title,
                  description: onboardingData[index].description,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.05,
              ),
              child: _pageIndex != onboardingData.length - 1
                  ? SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: _pageIndex == index ? 16 : 8,
                            decoration: BoxDecoration(
                              color: _pageIndex == index
                                  ? const Color.fromRGBO(97, 79, 168, 1)
                                  : const Color.fromRGBO(198, 187, 255, 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 50,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(97, 79, 168, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            _createLoginRoute(),
                          );
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Route _createLoginRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class Onboard {
  final String lottieLink, title, description;

  Onboard({
    required this.lottieLink,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onboardingData = [
  Onboard(
    lottieLink: "assets/points.json",
    title: "Explore stores near you!",
    description:
        "PointX helps you find the best stores around you, and get the best deals and offers on new products.",
  ),
  Onboard(
    lottieLink: "assets/points.json",
    title: "Explore stores near you!",
    description:
        "PointX helps you find the best stores around you, and get the best deals and offers on new products.",
  ),
  Onboard(
    lottieLink: "assets/points.json",
    title: "Explore stores near you!",
    description:
        "PointX helps you find the best stores around you, and get the best deals and offers on new products.",
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.lottieLink,
    required this.title,
    required this.description,
  });

  final String lottieLink, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Lottie.asset(lottieLink),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }
}
