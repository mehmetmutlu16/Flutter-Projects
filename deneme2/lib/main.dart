import 'package:deneme2/10x10.dart';
import 'package:deneme2/15x15.dart';
import 'package:deneme2/5x5.dart';
import 'package:deneme2/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nonogram',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Color> colors = [
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<Color> startColors = [
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.tealAccent,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  final List<int> emptyIndexes = [0, 1, 2, 3, 4, 5, 6, 12, 18, 24, 30];
  List<Color> trueColors = [
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.tealAccent,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.tealAccent,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.tealAccent,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.tealAccent,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.tealAccent,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
  ];
  List<Color> failureColors = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ];
  List<Color> startFailureColors = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ];
  List<bool> cellClicked = List.generate(36, (index) => false);

  Color failure = Colors.red;

  Color healthColor1 = Colors.red;
  Color healthColor2 = Colors.red;
  Color healthColor3 = Colors.red;

  bool isFinish = false;

  int counter = 0;
  int healthCounter = 0;

  Widget healthBar(Color renk){
    return Icon(
      Icons.favorite,
      color: renk,
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
                title: const Center(child: Text("YOU WIN")),
                content: Image.asset('images/cat.png'),
                actions: [
                  TextButton(
                    onPressed: (){
                      restart();
                      Navigator.pop(context);
                    },
                    child: const Text("RESTART", style: TextStyle(color: Colors.black),),
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

  void gameOver(BuildContext context){
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
                title: const Center(child: Text("OH!!!")),
                content: Text("GAME OVER"),
                actions: [
                  TextButton(
                    onPressed: (){
                      restart();
                      Navigator.pop(context);
                    },
                    child: const Text("RESTART"),
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

  void restart(){
    setState(() {
      colors = List.from(startColors);
      healthCounter=0;
      counter=0;
      failureColors = List.from(startFailureColors);
      healthColor1 = Colors.red;
      healthColor2 = Colors.red;
      healthColor3 = Colors.red;
      cellClicked = List.generate(36, (index) => false);
      isFinish=false;
    });
  }

  void changeColor(int index){
    if (cellClicked[index] == true) {
      return;
    }
    setState(() {
      if(trueColors[index]!=Colors.black){
        colors[index] = Colors.white;
        failureColors[index] = Colors.red;
        healthCounter+=1;
        if(healthCounter==1){
          setState(() {
            healthColor3 = Colors.black;
          });
        }else if(healthCounter==2){
          setState(() {
            healthColor3 = Colors.black;
            healthColor2 = Colors.black;
          });
        }else if(healthCounter==3){
          setState(() {
            healthColor3 = Colors.black;
            healthColor2 = Colors.black;
            healthColor1 = Colors.black;
          });
        }
        if(healthCounter==3){
          print("$healthCounter");
          isFinish = true;
          gameOver(context);
        }
      } else{
        colors[index] = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NONOGRAM CLONE"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const fiveXfive()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[200]
                  ),
                  child: const Center(
                    child: Text("5x5", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const tenXten()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[200]
                  ),
                  child: const Center(
                    child: Text("10x10", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const fifteenXfifteen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[200]
                  ),
                  child: const Center(
                    child: Text("15x15", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold catLevel() {
    return Scaffold(
    appBar: AppBar(
      title: const Text("NONOGRAM"),
      centerTitle: true,
      backgroundColor: Colors.teal,
    ),
    body: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              shrinkWrap: true,
              itemCount: 36,
              itemBuilder: (context, index) {
                if (emptyIndexes.contains(index)) {
                  if(index==0){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                    );
                  }else if(index==1){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("5", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==2){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("3", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==3){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("5", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==4){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("2", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==5){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("5", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==6){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("3", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==12){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("3 1", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==18){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("5", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==24){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("5", style: TextStyle(fontSize: 20),)),
                    );
                  }else if(index==30){
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                      child: const Center(child: Text("1 1 1", style: TextStyle(fontSize: 20),)),
                    );
                  }
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.tealAccent,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: (){
                      changeColor(index);
                      cellClicked[index] = true;
                      for(int i=0;i<36;i++){
                        if(colors[i] == trueColors[i]){
                          counter++;
                          print(counter);
                          if(counter==36){
                            winGame(context);
                          }
                        }
                      }
                      counter = 0;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors[index],
                      ),
                      child: Icon(
                        Icons.close,
                        color: failureColors[index],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              healthBar(healthColor1),
              healthBar(healthColor2),
              healthBar(healthColor3),
            ],
          )
        ],
      ),
    ),
  );
  }
}

