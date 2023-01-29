import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import "dart:math" as math;
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
    return Container(
      //gradient background radial top left to bottom right
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.5, -0.5),
          radius: 1.5,
          colors: [
            Color.fromRGBO(113, 99, 186, 1),
            Color.fromRGBO(70, 53, 157, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                                    ? Color.fromARGB(255, 111, 96, 169)
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
                        width: 120,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-1.0, 0.0),
                            end: Alignment(1.0, 0.0),
                            transform: GradientRotation(math.pi / 4),
                            colors: [
                              Color.fromRGBO(113, 99, 186, 1),
                              Color.fromRGBO(113, 99, 186, .6),
                            ],
                          ),
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
                            "Get Started!",
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
    title: "Earn points for every purchase!",
    description:
        "With PointX you earn points for every purchase you make, use these points to get discounts on future purchases!",
  ),
  Onboard(
    lottieLink: "assets/explore.json",
    title: "Explore new stores near you!",
    description:
        "PointX helps you find the best stores around you, and get the best deals and offers on new products. ",
  ),
  Onboard(
    lottieLink: "assets/swap.json",
    title: "Swap points between stores!",
    description:
        "Loyalty should always be rewarded, and PointX does just that. Swap points between stores and get the best deals!",
  )
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
        Stack(
          children: [
            Image.asset(
              "assets/bg-gradient.png",
              fit: BoxFit.cover,
            ),
            Lottie.asset(lottieLink),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 16, color: Colors.white54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }
}
