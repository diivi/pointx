import 'package:flutter/material.dart';
import 'package:pointx/data/stores_data.dart';
import 'package:pointx/screens/store_screen.dart';
import 'package:pointx/widgets/store_overview.dart';

class SelectStoreScreen extends StatelessWidget {
  const SelectStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // search box
            const SearchBox(),
            const SizedBox(height: 16),
            // list of stores
            Flexible(
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
                      highlightNewPerks: false,
                      onTap: () {
                        Navigator.of(context).pop(storeData[index]);
                      },
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
