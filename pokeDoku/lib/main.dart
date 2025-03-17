import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const PokeDokuApp());
}

class PokeDokuApp extends StatelessWidget {
  const PokeDokuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Alata',
      ),
      home: PokeDokuHomePage(),
    );
  }
}

class PokeDokuHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF063443), Color(0xFF4c94a3)], // Arka plan gradyanı
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Siyah border
                Text(
                  'POKÉ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Colors.black, // Siyah border
                  ),
                ),
                // Beyaz dolgu
                const Text(
                  'POKÉ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Beyaz renk
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                // Siyah border
                Text(
                  'DOKU',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Colors.black, // Siyah border
                  ),
                ),
                // Açık mavi dolgu
                const Text(
                  'DOKU',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue, // Açık mavi renk
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Container(
                width: 240,
                child: Column(
                  children: [
                    _buildMenuButton('Oyna', () {
                      // Oyna butonuna tıklanınca yapılacak işlemler
                    }),
                    const SizedBox(height: 10),
                    _buildMenuButton('Ayarlar', () {
                      // Ayarlar butonuna tıklanınca yapılacak işlemler
                    }),
                    const SizedBox(height: 10),
                    _buildMenuButton('Bize Ulaşın', () {
                      // Bize Ulaşın butonuna tıklanınca yapılacak işlemler
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlueAccent, // Buton rengi
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minimumSize: const Size(100, 60), // Genişlik ve yükseklik eşit
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      child: Align(
        alignment: Alignment.centerLeft, // Yazıyı sola hizala
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Yazıya biraz iç boşluk ekle
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
