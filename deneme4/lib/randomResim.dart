import 'dart:math';

import 'package:flutter/material.dart';

class randomResim extends StatefulWidget {
  const randomResim({super.key});

  @override
  State<randomResim> createState() => _randomResimState();
}

class _randomResimState extends State<randomResim> {

  int _randomNumber = 1;

  void _generateRandomNumber() {
    final random = Random();
    setState(() {
      _randomNumber = random.nextInt(20); // 0 ile 99 arasında rastgele bir sayı üretir
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text("DÜNYANIN EN TATLI ÇİFTİ"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width: 400,
              height: 400,
              child: Image.asset("images/resim$_randomNumber.jpg"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                _generateRandomNumber();
              },
              child: Text("Bi Dahaa", style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                backgroundColor: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
