import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kart Oyunu',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kart Oyunu'),
        ),
        body: Center(
          child: KartOyunu(),
        ),
      ),
    );
  }
}

class KartOyunu extends StatefulWidget {
  @override
  _KartOyunuState createState() => _KartOyunuState();
}

class _KartOyunuState extends State<KartOyunu> {
  bool kartAcik = false;

  void kartiAc() {
    setState(() {
      kartAcik = !kartAcik;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: kartiAc,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: kartAcik ? 200.0 : 100.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: kartAcik ? Colors.blue : Colors.red, // Ön ve arka yüz renkleri
              borderRadius: BorderRadius.circular(kartAcik ? 20.0 : 10.0),
            ),
            child: Center(
              child: Text(
                kartAcik ? 'Ön Yüz' : 'Arka Yüz',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
