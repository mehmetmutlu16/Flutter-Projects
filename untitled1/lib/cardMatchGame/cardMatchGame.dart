import 'dart:async';
import 'package:flutter/material.dart';

import '../changePage.dart';

class cardMatchGame extends StatefulWidget {
  @override
  _cardMatchGameState createState() => _cardMatchGameState();
}

class _cardMatchGameState extends State<cardMatchGame> {
  List<String> _kartlar = [];
  List<int> _acikKartlar = [];
  int? _oncekiSecim;
  int _dogruTahminSayisi = 0;
  bool _tumKartlarAcildi = false;
  int sayi = 0;
  late int candy;
  late Timer _timer;
  int _counter = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          _counter++;
        },
      ),
    );
  }

  void stopTimer() {
    _timer.cancel();
  }

  void resetTimer() {
    _timer.cancel();
    setState(() {
      _counter = 0;
    });
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    _kartlariOlustur();
    startTimer();
  }

  void _kartlariOlustur() {
    _kartlar.clear();
    _kartlar.add('assets/cardMatchGame/bulbasaur.jpeg');
    _kartlar.add('assets/cardMatchGame/bulbasaur.jpeg');
    _kartlar.add('assets/cardMatchGame/pikachu.jpg');
    _kartlar.add('assets/cardMatchGame/pikachu.jpg');
    _kartlar.add('assets/cardMatchGame/charmander.jpeg');
    _kartlar.add('assets/cardMatchGame/charmander.jpeg');
    _kartlar.add('assets/cardMatchGame/koffing.jpeg');
    _kartlar.add('assets/cardMatchGame/koffing.jpeg');
    _kartlar.add('assets/cardMatchGame/squirtle.jpeg');
    _kartlar.add('assets/cardMatchGame/squirtle.jpeg');
    _kartlar.add('assets/cardMatchGame/vulpix.jpeg');
    _kartlar.add('assets/cardMatchGame/vulpix.jpeg');
    _kartlar.add('assets/cardMatchGame/jigglypuff.jpeg');
    _kartlar.add('assets/cardMatchGame/jigglypuff.jpeg');
    _kartlar.add('assets/cardMatchGame/psyduck.jpg');
    _kartlar.add('assets/cardMatchGame/psyduck.jpg');
    _kartlar.shuffle();
  }


  void _kartAc(int index) {
    if (sayi >= 2 || _acikKartlar.contains(index)) return;

    if (_oncekiSecim == null) {
      setState(() {
        _acikKartlar.add(index);
        sayi++;
      });
      _oncekiSecim = index;
    } else {
      int oncekiKart = _oncekiSecim!;
      if (_kartlar[oncekiKart] == _kartlar[index]) {
        setState(() {
          _acikKartlar.add(index);
          _dogruTahminSayisi++;
          sayi=0;
        });
        if (_dogruTahminSayisi == 8) {
          _oyunuBitir();
        }
      } else {
        setState(() {
          _acikKartlar.add(index);
          sayi++;
        });
        Timer(const Duration(seconds: 1), () {
          setState(() {
            _acikKartlar.remove(oncekiKart);
            sayi--;
            _acikKartlar.remove(index);
            sayi--;
          });
        });
      }
      _oncekiSecim = null;
    }
  }

  void _oyunuBitir() {
    setState(() {
      _tumKartlarAcildi = true;
      showResult();
    });
  }

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[100],
        title: const Text("Congratulations"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const changePage()),
                    (route) => false,
              );
              setState(() {
                _kartlariOlustur();
                _acikKartlar.clear();
                _oncekiSecim = null;
                _dogruTahminSayisi = 0;
                _tumKartlarAcildi = false;
              });
            },
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        centerTitle: true,
        title: const Text('Card Game'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 420,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(
                  16,
                      (index) => GestureDetector(
                    onTap: () {
                      if (!_tumKartlarAcildi) {
                        _kartAc(index);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: _acikKartlar.contains(index)
                            ? Colors.white
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal,
                            offset: const Offset(1, 1),
                            blurRadius:
                            _acikKartlar.contains(index) ? 0 : 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: _acikKartlar.contains(index) ||
                            _tumKartlarAcildi
                            ? Image.asset(
                          _kartlar[index],
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        )
                            : Image.asset('assets/cardMatchGame/cardBack.jpg',fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Time: $_counter Second',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.refresh, color: Colors.white,),
        onPressed: () {
          setState(() {
            resetTimer();
            _kartlariOlustur();
            _acikKartlar.clear();
            _oncekiSecim = null;
            _dogruTahminSayisi = 0;
            _tumKartlarAcildi = false;
          });
        },
      ),
    );
  }
}
