import 'package:flutter/material.dart';

import 'ana_sayfa.dart';

void main(){
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget {
  const AnaUygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
    );
  }
}
