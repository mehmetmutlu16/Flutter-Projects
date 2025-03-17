import 'package:deneme4/askHesaplayici.dart';
import 'package:deneme4/memoCard.dart';
import 'package:deneme4/randomResim.dart';
import 'package:deneme4/sarkiOnerisi.dart';
import 'package:flutter/material.dart';

import 'lutfenTikla.dart';

class ilkSayfa extends StatefulWidget {
  const ilkSayfa({super.key});

  @override
  State<ilkSayfa> createState() => _ilkSayfaState();
}

class _ilkSayfaState extends State<ilkSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text("Hoşgeldin Prenses"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => askHesaplayici()));
                },
                child: Text("Aşk Hesaplayıcı"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => randomResim()));
                },
                child: Text("Rastgele Resim"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => sarkiOnerisi()));
                },
                child: Text("Şarkı Önerisi"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => memoCard()));
                },
                child: Text("Memo Kart"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => lutfenTikla()));
                },
                child: Text("Lütfen Tıklayınız"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
