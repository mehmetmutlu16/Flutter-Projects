import 'package:flutter/material.dart';

class askHesaplayici extends StatefulWidget {
  const askHesaplayici({super.key});

  @override
  State<askHesaplayici> createState() => _askHesaplayiciState();
}

class _askHesaplayiciState extends State<askHesaplayici> {

  int sayi1 = 5;
  int sayi2 = 100;
  double slider = 15;
  Color secim = Colors.green;
  Color secmeme = Colors.redAccent;
  Color normal = Colors.redAccent;
  Color normal2 = Colors.redAccent;
  Color normal3 = Colors.redAccent;
  Color normal4 = Colors.redAccent;
  Color normal5 = Colors.redAccent;
  Color normal6 = Colors.redAccent;

  void guzelim(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation1, animation2){
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget){
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                title: const Center(child: Text("GÜZELİM")),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      bitanem(context);
                    },
                    child: const Text("HEH", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          );
        }
    );
  }
  void bitanem(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation1, animation2){
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget){
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                title: const Center(child: Text("BİTANEM")),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      bebegim(context);
                    },
                    child: const Text("HEH", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          );
        }
    );
  }
  void bebegim(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation1, animation2){
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget){
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                title: const Center(child: Text("BEBEĞİM")),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      ilaydam(context);
                    },
                    child: const Text("HEH", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          );
        }
    );
  }
  void ilaydam(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation1, animation2){
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget){
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                title: const Center(child: Text("İLAYDAM")),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      winGame(context);
                    },
                    child: const Text("HEH", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          );
        }
    );
  }

  void winGame(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation1, animation2){
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget){
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                title: const Center(child: Text("MEMO SENİ SONSUZ SEVİYOR SONSUZZZZ")),
                content: Image.asset('images/resim1.jpg'),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("HIHI", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memo Ne Kadar Seviyor?"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple[100],
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RotatedBox(
                            quarterTurns: 3, // 90 derece saat yönünün tersine çevirmek için
                            child: Text(
                              "Bir sayı?",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3, // 90 derece saat yönünün tersine çevirmek için
                            child: Text(
                              '$sayi1',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    if(sayi1>=10){
                                      setState(() {
                                        sayi1=9;
                                      });
                                    }
                                    sayi1+=1;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secim,
                                ),
                                child: Text("+", style: TextStyle(fontSize: 30),),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    if(sayi1<=0){
                                      setState(() {
                                        sayi1=1;
                                      });
                                    }
                                    sayi1-=1;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secmeme,
                                ),
                                child: Text("-", style: TextStyle(fontSize: 30),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RotatedBox(
                            quarterTurns: 3, // 90 derece saat yönünün tersine çevirmek için
                            child: Text(
                              "Bir sayı daha?",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3, // 90 derece saat yönünün tersine çevirmek için
                            child: Text(
                              '$sayi2',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    sayi2+=1;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secim,
                                ),
                                child: Text("+", style: TextStyle(fontSize: 30),),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    sayi2-=1;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secmeme,
                                ),
                                child: Text("-", style: TextStyle(fontSize: 30),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Memo ne kadar yakışıklı?" , style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text("${slider.toInt()}", style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          Slider(
                            activeColor: secim,
                            inactiveColor: secmeme,
                            value: slider,
                            max: 30,
                            min: 0,
                            label: slider.toString(),
                            onChanged: (value){
                              setState(() {
                                slider=value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bir öpücük?', style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    normal2 = secim;
                                    normal = secmeme;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: normal2,
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20)
                                ),
                                child: Text("OLUR", style: TextStyle(fontSize: 20),),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    normal = secim;
                                    normal2 = secmeme;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: normal,
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20)
                                ),
                                child: Text("ZATEN", style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ÇABUKK?', style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    normal3 = secim;
                                    normal4 = secmeme;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: normal3,
                                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5)
                                ),
                                child: const Text("FB", style: TextStyle(fontSize: 20),),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    normal3 = secim;
                                    normal4 = secmeme;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: normal4,
                                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5)
                                ),
                                child: Text("GS", style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('SONUCA GÜVENİYORUM', style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    normal5 = secim;
                                    normal6 = secmeme;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: normal5,
                                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5)
                                ),
                                child: const Text("EVET", style: TextStyle(fontSize: 20),),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    normal6 = secim;
                                    normal5 = secmeme;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: normal6,
                                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5)
                                ),
                                child: const Text("HAYIR", style: TextStyle(fontSize: 20),),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ElevatedButton(
              onPressed: (){
                guzelim(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 10)
              ),
              child: Text("HESAPLA"),
            ),
          ),
        ],
      ),
    );
  }
}
