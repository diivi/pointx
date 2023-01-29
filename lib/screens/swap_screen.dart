import 'package:flutter/material.dart';
import 'package:pointx/custom_icons.dart';
import 'package:pointx/data/stores_data.dart';
import 'package:pointx/models/store_overview.dart';
import 'package:pointx/widgets/store_overview.dart';
import 'dart:math' as math;
import 'package:slide_to_confirm/slide_to_confirm.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  StoreOverview _sourceStore = storeData[0];
  StoreOverview? _finalStore;

  Future<void> _navigateAndSelectSourceStore(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/select_store');
    if (result != null) {
      setState(() {
        _sourceStore = result as StoreOverview;
      });
    }
  }

  Future<void> _navigateAndSelectFinalStore(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/select_store');
    if (result != null) {
      setState(() {
        _finalStore = result as StoreOverview;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 18, left: 32, right: 32),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: SingleChildScrollView(
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
                        color: Color.fromRGBO(0, 0, 0, .2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // choose store container with store icon and text
                StoreOverviewCard(
                  name: _sourceStore.name,
                  points: _sourceStore.points,
                  perksAvailable: _sourceStore.perksAvailable,
                  newPerks: _sourceStore.newPerks,
                  logoUrl: _sourceStore.logoUrl,
                  highlightNewPerks: false,
                  onTap: () => {},
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(113, 99, 186, 1),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // source store logo in circle white container next to dropdown arrow next to number input field
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  splashColor: Colors.white.withOpacity(.05),
                                  highlightColor: Colors.white.withOpacity(.05),
                                  onTap: () =>
                                      _navigateAndSelectSourceStore(context),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.network(
                                                _sourceStore.logoUrl),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          CustomIcons.dropdown,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 32),
                              // number input textfield
                              Expanded(
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: ShapeDecoration(
                                    shadows: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(198, 187, 255, 1),
                                        blurRadius: 1,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: TextField(
                                    showCursor: false,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 30, top: 8),
                                      border: InputBorder.none,
                                      hintText: "0",
                                      hintStyle: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      suffixIcon: Transform.rotate(
                                        angle: math.pi * 0.1,
                                        child: const Icon(
                                          CustomIcons.star_7,
                                          color:
                                              Color.fromRGBO(254, 134, 173, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // source store logo in circle white container next to dropdown arrow next to number input field
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  splashColor: Colors.white.withOpacity(.05),
                                  highlightColor: Colors.white.withOpacity(.05),
                                  onTap: () =>
                                      _navigateAndSelectFinalStore(context),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: _finalStore == null
                                                ? const Icon(
                                                    Icons.store,
                                                    color: Color.fromRGBO(
                                                        113, 99, 186, 1),
                                                  )
                                                : Image.network(
                                                    _finalStore!.logoUrl),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          CustomIcons.dropdown,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 32),
                              // number input textfield
                              Expanded(
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: ShapeDecoration(
                                    shadows: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(198, 187, 255, 1),
                                        blurRadius: 1,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: TextField(
                                    showCursor: false,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 30, top: 8),
                                      border: InputBorder.none,
                                      hintText: "0",
                                      hintStyle: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      suffixIcon: Transform.rotate(
                                        angle: math.pi * 0.1,
                                        child: const Icon(
                                          CustomIcons.star_7,
                                          color:
                                              Color.fromRGBO(254, 134, 173, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(113, 99, 186, 1),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, .3),
                                    blurRadius: 3,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                CustomIcons.swap,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => {},
                  child: _finalStore == null
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
                          name: _finalStore!.name,
                          points: _finalStore!.points,
                          perksAvailable: _finalStore!.perksAvailable,
                          newPerks: _finalStore!.newPerks,
                          logoUrl: _finalStore!.logoUrl,
                          highlightNewPerks: false,
                        ),
                ),
                const SizedBox(height: 15),
                // slde to confirm button
                ConfirmationSlider(
                  onConfirmation: () => {},
                  stickToEnd: true,
                  sliderButtonContent: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(254, 134, 173, 1),
                    size: 20,
                  ),
                  backgroundColor: const Color.fromRGBO(254, 134, 173, 1),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  foregroundColor: Colors.white,
                  height: 60,
                  width: 250,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
