import 'package:flutter/material.dart';
import 'package:food_menu/panel.dart';

void main() {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget {
  const AnaUygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: panel(),
    );
  }
}
