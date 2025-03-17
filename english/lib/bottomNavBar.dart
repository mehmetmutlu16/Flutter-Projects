import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.business, 1),
              _buildNavItem(Icons.school, 2),
              _buildNavItem(Icons.settings, 3),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
            showUnselectedLabels: false, // Hide labels for unselected items
            showSelectedLabels: false,   // Hide labels for selected items
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconSize: 30,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.red.withOpacity(0.3) : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.red : Colors.transparent,
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.red : Colors.white,
        ),
      ),
      label: '', // Remove label text
    );
  }
}
