import 'package:flutter/material.dart';
import 'package:pointx/models/store_overview.dart';
import 'package:pointx/widgets/store_overview.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  StoreOverview? _sourceStore;

  Future<void> _navigateAndSelectSourceStore(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/select_store');
    if (result != null) {
      setState(() {
        _sourceStore = result as StoreOverview;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 18, left: 32, right: 32),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Swap Points",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(113, 99, 186, 1),
                  ),
                ),
                const SizedBox(width: 10),
                // info icon
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: Color.fromRGBO(0, 0, 0, .5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // choose store container with store icon and text
            GestureDetector(
              onTap: () => _navigateAndSelectSourceStore(context),
              child: _sourceStore == null
                  ? Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(width: 10),
                          Icon(
                            Icons.store,
                            color: Color.fromARGB(126, 167, 109, 109),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Tap to Choose Store",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, .5),
                            ),
                          ),
                        ],
                      ),
                    )
                  : StoreOverviewCard(
                      name: _sourceStore!.name,
                      points: _sourceStore!.points,
                      perksAvailable: _sourceStore!.perksAvailable,
                      newPerks: _sourceStore!.newPerks,
                      logoUrl: _sourceStore!.logoUrl,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
