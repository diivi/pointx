import 'package:flutter/material.dart';
import 'package:pointx/widgets/store_overview.dart';

import '../data/stores_data.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 18, left: 32, right: 32),
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
                const Expanded(
                  child: SearchBox(),
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
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: StoreOverviewCard(
                        name: storeData[index].name,
                        points: storeData[index].points,
                        perksAvailable: storeData[index].perksAvailable,
                        newPerks: storeData[index].newPerks,
                        logoUrl: storeData[index].logoUrl,
                        highlightNewPerks: true,
                        onTap: () {
                          // navigate to store details
                          Navigator.pushNamed(
                            context,
                            '/store_details',
                            arguments: storeData[index],
                          );
                        },
                      ),
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

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
