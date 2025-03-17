import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'changeBottomBar.dart'; // Import FontAwesome package

class changePage extends StatefulWidget {
  const changePage({Key? key}) : super(key: key);

  @override
  State<changePage> createState() => _changePageState();
}

class _changePageState extends State<changePage> {
  int seciliIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: bottomNav(),
        body: Center(
          child: liste[seciliIndex],
        ),
      ),
    );
  }

  GNav bottomNav() {
    return GNav(
      backgroundColor: Colors.teal,
      color: Colors.white,
      activeColor: Colors.white,
      tabBackgroundColor: Colors.black45,
      gap: 5,
      padding: const EdgeInsets.all(16),
      tabs: const [
        GButton(icon: FontAwesomeIcons.house), // Use Font Awesome icon directly
        GButton(icon: FontAwesomeIcons.solidHeart), // Use Font Awesome icon directly
        GButton(icon: FontAwesomeIcons.gamepad),
      ],
      selectedIndex: seciliIndex,
      onTabChange: (index) {
        setState(() {
          seciliIndex = index;
        });
      },
    );
  }
}
