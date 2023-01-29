import 'package:flutter/material.dart';
import 'package:pointx/screens/history_screen.dart';
import 'package:pointx/screens/store_screen.dart';
import 'package:pointx/screens/swap_screen.dart';

import '../custom_icons.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    const StoreScreen(),
    const HistoryScreen(),
    const SwapScreen(),
    const StoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // to keep the size, when opening the keyboard
      body: screens[_selectedIndex],
      // bottom nav with 4 items, active color = rgba(254, 134, 173, 0.36) and inactive color = rgba(208, 208, 208, 1)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color.fromRGBO(108, 95, 179, 0.5),
        unselectedItemColor: const Color.fromRGBO(0, 0, 0, .2),
        iconSize: 36,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              CustomIcons.star_7,
              // purple inner shadow on the icon
              shadows: _selectedIndex == 0
                  ? const [
                      BoxShadow(
                        color: Color.fromRGBO(108, 95, 179, 1),
                        blurRadius: 10,
                        spreadRadius: -2,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        blurRadius: 10,
                        spreadRadius: -5,
                      )
                    ]
                  : [],
            ),
            label: 'Points',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.history,
              shadows: _selectedIndex == 1
                  ? const [
                      BoxShadow(
                        color: Color.fromRGBO(108, 95, 179, 1),
                        blurRadius: 10,
                        spreadRadius: -2,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        blurRadius: 10,
                        spreadRadius: -5,
                      )
                    ]
                  : [],
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.swap,
              shadows: _selectedIndex == 2
                  ? const [
                      BoxShadow(
                        color: Color.fromRGBO(108, 95, 179, 1),
                        blurRadius: 10,
                        spreadRadius: -2,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        blurRadius: 10,
                        spreadRadius: -5,
                      )
                    ]
                  : [],
            ),
            label: 'Swap',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.profile,
              shadows: _selectedIndex == 3
                  ? const [
                      BoxShadow(
                        color: Color.fromRGBO(108, 95, 179, 1),
                        blurRadius: 10,
                        spreadRadius: -2,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        blurRadius: 10,
                        spreadRadius: -5,
                      )
                    ]
                  : [],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
