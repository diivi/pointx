import 'package:flutter/material.dart';

class StoreOverviewCard extends StatelessWidget {
  const StoreOverviewCard(
      {super.key,
      required this.name,
      required this.points,
      required this.perksAvailable,
      required this.newPerks,
      required this.logoUrl,
      this.highlightNewPerks = true,
      this.onTap});

  final String name;
  final int points;
  final int perksAvailable;
  final int newPerks;
  final String logoUrl;
  final bool highlightNewPerks;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: newPerks > 0 && highlightNewPerks
              ? const Color.fromRGBO(108, 95, 179, 1)
              : const Color.fromRGBO(242, 242, 242, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(
                      logoUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: newPerks > 0 && highlightNewPerks
                            ? Colors.white
                            : const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    Text(
                      '${newPerks > 0 && highlightNewPerks ? newPerks : perksAvailable} ${newPerks > 0 && highlightNewPerks ? 'new perks' : 'perks available'}',
                      style: TextStyle(
                        fontSize: 14,
                        color: newPerks > 0 && highlightNewPerks
                            ? Colors.white
                            : const Color.fromRGBO(99, 99, 99, 1),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
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
                      points.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
