import 'package:flutter/material.dart';
import 'dart:math';

import 'package:untitled1/blackjack/cards.dart';

class blackjack extends StatefulWidget {
  const blackjack({super.key});

  @override
  State<blackjack> createState() => _blackjackState();
}

class _blackjackState extends State<blackjack> with SingleTickerProviderStateMixin{

  Random random = Random();
  late int randomNumber1;
  late int randomNumber2;
  late int randomNumber3;
  late int randomNumber4;
  bool hit1 = false;
  late int randomHitNumber1;
  int sayac1 = 0;
  bool hit2 = false;
  late int randomHitNumber2;
  int sayac2 = 0;
  bool hit3 = false;
  late int randomHitNumber3;
  int sayac3 = 0;
  bool hit4 = false;
  late int randomHitNumber4;
  int sayac4 = 0;

  int kredi = 1000;

  int oyuncuToplam = 0;

  int pcToplam = 0;

  late bool basladi;

  late AnimationController _controller;
  late Animation<double> _animation;

  bool kartAcik = true;

  @override
  void initState() {
    super.initState();
    basladi = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      tokenDialog(context).then((_) {
        _initializeGame();
      });
    });
  }

  void _initializeGame() {
    randomNumber1 = random.nextInt(13);
    randomNumber2 = random.nextInt(13);
    randomNumber3 = random.nextInt(13);
    randomNumber4 = random.nextInt(13);
    print(randomNumber1);
    print(randomNumber2);
    print(randomNumber3);
    print(randomNumber4);

    setState(() {
      pcToplam = kartlar[randomNumber1].deger;
      oyuncuToplam = kartlar[randomNumber3].deger;
      oyuncuToplam += kartlar[randomNumber4].deger;
      kredi -= selectedKredi;
    });

    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void kartiAc() {
    setState(() {
      kartAcik = !kartAcik;
      if (kartAcik) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  Widget hitButton(){
    if(sayac1==0){
      randomHitNumber1 = random.nextInt(12) + 1;
      sayac1++;
    }
    if(hit1 == true){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 60,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white
          ),
          child: Image.asset(kartlar[randomHitNumber1].image),
        ),
      );
    }
    else{
      return Container();
    }
  }

  Widget hitButton2(){
    if(sayac2==0){
      randomHitNumber2 = random.nextInt(12) + 1;
      sayac2++;
    }
    if(hit2 == true){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 60,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white
          ),
          child: Image.asset(kartlar[randomHitNumber2].image),
        ),
      );
    }
    else{
      return Container();
    }
  }

  Widget pcHitButton(){
    if(sayac3==0){
      randomHitNumber3 = random.nextInt(12) + 1;
      sayac3++;
    }
    if(hit3 == true){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 60,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white
          ),
          child: Image.asset(kartlar[randomHitNumber3].image),
        ),
      );
    }
    else{
      return Container();
    }
  }

  Widget pcHitButton2(){
    if(sayac4==0){
      randomHitNumber4 = random.nextInt(12) + 1;
      sayac4++;
    }
    if(hit4 == true){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 60,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white
          ),
          child: Image.asset(kartlar[randomHitNumber4].image),
        ),
      );
    }
    else{
      return Container();
    }
  }

  pcWin() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[100],
        title: Text("You Lost"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              oyuncuToplam = 0;
              pcToplam = 0;
              hit1 = false;
              hit2 = false;
              hit3 = false;
              hit4 = false;
              sayac1 = 0;
              sayac2 = 0;
              sayac3 = 0;
              sayac4 = 0;
              kartAcik = true;

              randomNumber1 = random.nextInt(13);
              randomNumber2 = random.nextInt(13);
              randomNumber3 = random.nextInt(13);
              randomNumber4 = random.nextInt(13);

              setState(() {
                pcToplam = kartlar[randomNumber1].deger;
                oyuncuToplam = kartlar[randomNumber3].deger;
                oyuncuToplam += kartlar[randomNumber4].deger;
              });
              Navigator.pop(context);
              setState(() {
                kredi-=selectedKredi;
              });
            },
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }

  beraberlik() {
    setState(() {
      kredi += selectedKredi;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[100],
        title: Text("Draw"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              oyuncuToplam = 0;
              pcToplam = 0;
              hit1 = false;
              hit2 = false;
              hit3 = false;
              hit4 = false;
              sayac1 = 0;
              sayac2 = 0;
              sayac3 = 0;
              sayac4 = 0;
              kartAcik = true;

              randomNumber1 = random.nextInt(13);
              randomNumber2 = random.nextInt(13);
              randomNumber3 = random.nextInt(13);
              randomNumber4 = random.nextInt(13);

              setState(() {
                pcToplam = kartlar[randomNumber1].deger;
                oyuncuToplam = kartlar[randomNumber3].deger;
                oyuncuToplam += kartlar[randomNumber4].deger;
              });
              Navigator.pop(context);
              setState(() {
                kredi-=selectedKredi;
              });
            },
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }

  playerWin() {
    setState(() {
      kredi+=2*selectedKredi;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[100],
        title: Text("You Win"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              oyuncuToplam = 0;
              pcToplam = 0;
              hit1 = false;
              hit2 = false;
              hit3 = false;
              hit4 = false;
              sayac1 = 0;
              sayac2 = 0;
              sayac3 = 0;
              sayac4 = 0;
              kartAcik = true;

              randomNumber1 = random.nextInt(13);
              randomNumber2 = random.nextInt(13);
              randomNumber3 = random.nextInt(13);
              randomNumber4 = random.nextInt(13);

              setState(() {
                pcToplam = kartlar[randomNumber1].deger;
                oyuncuToplam = kartlar[randomNumber3].deger;
                oyuncuToplam += kartlar[randomNumber4].deger;
              });
              Navigator.pop(context);
              setState(() {
                kredi-=selectedKredi;
              });
            },
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }

  surrender() {
    setState(() {
      kredi += (selectedKredi/2).toInt();
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[100],
        title: Text("Surrender"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              oyuncuToplam = 0;
              pcToplam = 0;
              hit1 = false;
              hit2 = false;
              hit3 = false;
              hit4 = false;
              sayac1 = 0;
              sayac2 = 0;
              sayac3 = 0;
              sayac4 = 0;
              kartAcik = true;

              randomNumber1 = random.nextInt(13);
              randomNumber2 = random.nextInt(13);
              randomNumber3 = random.nextInt(13);
              randomNumber4 = random.nextInt(13);

              setState(() {
                pcToplam = kartlar[randomNumber1].deger;
                oyuncuToplam = kartlar[randomNumber3].deger;
                oyuncuToplam += kartlar[randomNumber4].deger;
              });
              Navigator.pop(context);
              setState(() {
                kredi-=selectedKredi;
              });
            },
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }


  int selectedContainerIndex = -1;
  int selectedKredi = 0;

  dynamic tokenDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // Dialog dön
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(child: Text("Bahsiniz")),
              content: Container(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                          (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedContainerIndex = index;
                            selectedKredi = (index+1)*50;
                            print(selectedKredi);
                          });
                          print("$index Dokundu");
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedContainerIndex == index ? Colors.red : Colors.blue[200 * (index % 9)],
                            borderRadius: BorderRadius.circular(25), // Tamamen yuvarlak kenarlar
                            border: Border.all(
                              color: Colors.black, // Siyah çerçeve rengi
                              width: 2, // Çerçeve kalınlığı
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${(index+1)*50}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          basladi = true;
                        });
                      },
                      child: Text("Done"),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    if (basladi == false) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Blackjack"),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Text(
                  '$kredi Kredi',
                  key: ValueKey<int>(kredi),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.green[900],
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Blackjack"),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Text(
                  '$kredi Kredi',
                  key: ValueKey<int>(kredi),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.green[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white
                    ),
                    child: Image.asset(kartlar[randomNumber1].image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateY(3.14 * _animation.value),
                        child: child,
                      );
                    },
                    child: Container(
                      width: 60.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: kartAcik ? Colors.white : Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          kartAcik ? 'assets/card/back_001.png' : kartlar[randomNumber2].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                pcHitButton(),
                pcHitButton2(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${pcToplam}", style: TextStyle(fontSize: 16,color: Colors.white),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bahis: $selectedKredi Kredi", style: TextStyle(fontSize: 16,color: Colors.white),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${oyuncuToplam}", style: TextStyle(fontSize: 16,color: Colors.white),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white
                    ),
                    child: Image.asset(kartlar[randomNumber3].image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white
                    ),
                    child: Image.asset(kartlar[randomNumber4].image),
                  ),
                ),
                hitButton(),
                hitButton2(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        if (hit1 == false) {
                          hit1 = true;
                          oyuncuToplam += kartlar[randomHitNumber1].deger;
                        } else {
                          hit2 = true;
                          oyuncuToplam += kartlar[randomHitNumber2].deger;
                        }
                      });

                      if (oyuncuToplam > 21) {
                        print("Oyuncu kaybetti");
                        await Future.delayed(Duration(seconds: 1));
                        pcWin();
                        return; // Oyuncu kaybettiyse fonksiyonu sonlandırıyoruz.
                      }

                      if (oyuncuToplam == 21) {
                        kartiAc();
                        setState(() {
                          pcToplam += kartlar[randomNumber2].deger;
                        });

                        await Future.delayed(Duration(seconds: 1));

                        // Bilgisayarın hamlelerini gerçekleştiriyoruz.
                        while (pcToplam <= 16) {
                          if (hit3 == false) {
                            setState(() {
                              hit3 = true;
                              pcToplam += kartlar[randomHitNumber3].deger;
                            });
                          } else if (hit4 == false) {
                            setState(() {
                              hit4 = true;
                              pcToplam += kartlar[randomHitNumber4].deger;
                            });
                          }
                          await Future.delayed(Duration(seconds: 1));
                        }

                        // Kazananı belirleme aşaması.
                        if (pcToplam > 21 || oyuncuToplam > pcToplam) {
                          print("Oyuncu kazandı");
                          await Future.delayed(Duration(seconds: 1));
                          playerWin();
                        } else if (pcToplam == oyuncuToplam) {
                          print("Beraberlik");
                          await Future.delayed(Duration(seconds: 1));
                          beraberlik();
                        } else {
                          print("Pc kazandı");
                          await Future.delayed(Duration(seconds: 1));
                          pcWin();
                        }
                      }
                    },
                    child: Icon(
                      Icons.add,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      kartiAc();

                      // Bilgisayar ilk kartını açıyor.
                      setState(() {
                        pcToplam += kartlar[randomNumber2].deger;
                      });

                      // Bilgisayarın toplam puanı 16 veya daha düşük olduğu sürece ek kart çekmesi.
                      while (pcToplam <= 16) {
                        await Future.delayed(Duration(seconds: 1));
                        setState(() {
                          if (!hit3) {
                            hit3 = true;
                            pcToplam += kartlar[randomHitNumber3].deger;
                          } else if (!hit4) {
                            hit4 = true;
                            pcToplam += kartlar[randomHitNumber4].deger;
                          }
                        });
                      }

                      // Oyun sonucunun belirlenmesi.
                      await Future.delayed(Duration(seconds: 1));
                      if (pcToplam > 21 || oyuncuToplam > pcToplam) {
                        print("Oyuncu kazandı");
                        playerWin();
                      } else if (pcToplam == oyuncuToplam) {
                        print("Beraberlik");
                        beraberlik();
                      } else {
                        print("Pc kazandı");
                        pcWin();
                      }
                    },
                    child: Icon(
                      Icons.remove,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      setState(() {
                        hit1 = true;
                        kredi-=selectedKredi;
                        oyuncuToplam += kartlar[randomHitNumber1].deger;
                      });
                      if(oyuncuToplam>21){
                        print("Oyuncu kaybetti");
                        await Future.delayed(Duration(seconds: 1));
                        pcWin();
                      }
                      if(1==1){
                        kartiAc();
                        setState(() {
                          pcToplam += kartlar[randomNumber2].deger;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        if(pcToplam<=16){
                          hit3=true;
                          setState(() {
                            pcToplam += kartlar[randomHitNumber3].deger;
                          });
                          await Future.delayed(Duration(seconds: 1));
                        }
                        if(pcToplam<=16){
                          hit4=true;
                          setState(() {
                            pcToplam += kartlar[randomHitNumber4].deger;
                          });
                          await Future.delayed(Duration(seconds: 1));
                        }
                        if(pcToplam > 16 && pcToplam <=21 && pcToplam > oyuncuToplam){
                          await Future.delayed(Duration(seconds: 1));
                          print("Pc kazandı");
                          pcWin();
                        }else if(pcToplam == oyuncuToplam){
                          await Future.delayed(Duration(seconds: 1));
                          print("Beraberlik");
                          beraberlik();
                        }else{
                          await Future.delayed(Duration(seconds: 1));
                          print("Oyuncu kazandı");
                          kredi += selectedKredi*2;
                          playerWin();
                        }
                      }
                    },
                    child: Text("2X"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      surrender();
                    },
                    child: Icon(
                      Icons.flag,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
