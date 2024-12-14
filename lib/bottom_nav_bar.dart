import 'package:flutter/material.dart';

import 'package:svg_flutter/svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            // topLeft: Radius.circular(20),
            // topRight: Radius.circular(20),
            ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -2), // Shadow coming from the bottom
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        child: BottomNavigationBar(
          elevation: 8, // Add elevation for floating effect
          selectedItemColor: const Color(0xff0512F5),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/leads.svg',
              ),
              label: 'Leads',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/units.svg'),
              label: 'Units',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/reservations.svg'),
              label: 'Reservations',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/account.svg'),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
