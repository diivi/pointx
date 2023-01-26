import 'package:flutter/material.dart';
import 'package:pointx/components/store_overview.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logo.png',
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
            const SizedBox(height: 25),
            // search and sort
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(width: 10),
                        Icon(
                          Icons.search,
                          color: Color.fromRGBO(0, 0, 0, .5),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, .5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // rounded ripple button
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50),
                  splashColor: const Color.fromRGBO(113, 99, 186, 1),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 242, 242, .8),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(Icons.sort),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // stores list
            const Text(
              'Stores',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            //list of stores scrollable cards
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: ListView.builder(
                  itemCount: storeData.length,
                  itemBuilder: (context, index) {
                    return StoreOverviewCard(
                      name: storeData[index].name,
                      points: storeData[index].points,
                      perksAvailable: storeData[index].perksAvailable,
                      newPerks: storeData[index].newPerks,
                      logoUrl: storeData[index].logoUrl,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreOverview {
  final String name;
  final int points;
  final int perksAvailable;
  final int newPerks;
  final String logoUrl;

  StoreOverview({
    required this.name,
    required this.points,
    required this.perksAvailable,
    required this.newPerks,
    required this.logoUrl,
  });
}

List<StoreOverview> storeData = [
  StoreOverview(
    name: 'Walmart',
    points: 550,
    perksAvailable: 5,
    newPerks: 2,
    logoUrl: 'https://companieslogo.com/img/orig/WMT-0d8ecd74.png?t=1633217525',
  ),
  StoreOverview(
    name: 'Amazon',
    points: 450,
    perksAvailable: 7,
    newPerks: 0,
    logoUrl:
        'https://companieslogo.com/img/orig/AMZN-e9f942e4.png?t=1632523695',
  ),
  StoreOverview(
    name: 'Amazon',
    points: 450,
    perksAvailable: 7,
    newPerks: 0,
    logoUrl:
        'https://companieslogo.com/img/orig/AMZN-e9f942e4.png?t=1632523695',
  ),
  StoreOverview(
    name: 'Amazon',
    points: 450,
    perksAvailable: 7,
    newPerks: 0,
    logoUrl:
        'https://companieslogo.com/img/orig/AMZN-e9f942e4.png?t=1632523695',
  ),
  StoreOverview(
    name: 'Amazon',
    points: 450,
    perksAvailable: 7,
    newPerks: 0,
    logoUrl:
        'https://companieslogo.com/img/orig/AMZN-e9f942e4.png?t=1632523695',
  ),
];
