import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointx/models/store_overview.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StoreOverview;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 32, right: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                  // rounded image
                  Container(
                    height: 42,
                    width: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://avatars.githubusercontent.com/u/41837037?v=4"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                height: 180,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/details-bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args.name,
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset('assets/walmart-outline-logo.png'),
                    const SizedBox(height: 10),
                    Text(
                      '${args.points.toString()} points',
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${args.perksAvailable} perks available',
                      style: GoogleFonts.robotoMono(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // vertically scrolling pills list  - all, freebies, discounts, special
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(128, 99, 190, 1),
                      ),
                      child: const Center(
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: const Center(
                        child: Text(
                          'Freebies',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: const Center(
                        child: Text(
                          'Discounts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(242, 242, 242, 1),
                      ),
                      child: const Center(
                        child: Text(
                          'Special',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // perks grid view 2x2 with icon, title and description
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior(),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: perksData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: perksData[index].locked
                              ? const Color.fromRGBO(96, 96, 96, 1)
                              : const Color.fromRGBO(128, 99, 190, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(perksData[index].iconUrl),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/points-star.png',
                                        height: 18,
                                        width: 18,
                                      ),
                                      Text(
                                        args.points.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              perksData[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              perksData[index].description,
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Perk {
  final String title;
  final String description;
  final String iconUrl;
  final int points;
  final bool locked;

  Perk(
      {required this.title,
      required this.description,
      required this.iconUrl,
      required this.points,
      this.locked = false});
}

List<Perk> perksData = [
  Perk(
    title: 'Free Item',
    description:
        'Get any item for free upto Rs. 250 next time you visit a Walmart store',
    iconUrl: 'assets/gift.png',
    points: 750,
  ),
  Perk(
    title: 'Queue Priority',
    description: 'Skip the queue and get to the front at your next checkout',
    iconUrl: 'assets/people.png',
    points: 500,
  ),
  Perk(
    title: '25% Off',
    description: 'Get 25% off upto Rs. 250 on your next purchase',
    iconUrl: 'assets/discount.png',
    points: 250,
  ),
  Perk(
    title: 'Free Item',
    description:
        'Get any item for free upto Rs. 250 next time you visit a Walmart store',
    iconUrl: 'assets/gift.png',
    points: 1000,
    locked: true,
  ),
  Perk(
    title: 'Meet the CEO',
    description: 'Get a chance to meet the CEO of Walmart next time you visit',
    iconUrl: 'assets/lock.png',
    points: 10000,
    locked: true,
  ),
];
