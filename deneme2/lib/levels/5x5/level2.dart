import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class level2 extends StatefulWidget {
  const level2({super.key});

  @override
  State<level2> createState() => _level2State();
}

class _level2State extends State<level2> {

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
    Colors.tealAccent,
    Colors.black,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.black,
    Colors.tealAccent,
    Colors.black,
    Colors.white,
    Colors.white,
    Colors.white,
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
  bool isX = false;

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
                content: Image.asset('images/creeper.png'),
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

  void increaseHealth() {
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
  }

  void emptySides(int index){
    setState(() {
      failureColors[index] = failure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return catLevel();
  }

  Scaffold catLevel() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Level 2"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.blueGrey,
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
                      return borders("5");
                    }else if(index==2){
                      return borders("1 1");
                    }else if(index==3){
                      return borders("2 1");
                    }else if(index==4){
                      return borders("1 1");
                    }else if(index==5){
                      return borders("5");
                    }else if(index==6){
                      return  borders("5");
                    }else if(index==12){
                      return borders("1 1 1");
                    }else if(index==18){
                      return borders("2 2");
                    }else if(index==24){
                      return borders("1 1");
                    }else if(index==30){
                      return borders("1 1 1");
                    }
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () async{
                        if(isX == true){
                          emptySides(index);
                          if(trueColors[index] == Colors.black){
                            healthCounter+=1;
                            increaseHealth();
                            await Future.delayed(Duration(milliseconds: 500));
                            failureColors[index] = Colors.transparent;
                            changeColor(index);
                            if(healthCounter==3){
                              print("$healthCounter");
                              isFinish = true;
                              gameOver(context);
                            }
                          }
                        }else{
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
                        }
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LiteRollingSwitch(
                  value: false,
                  textOn: "Empty",
                  textOnColor: Colors.white,
                  textOff: "Paint",
                  colorOn: Colors.redAccent,
                  colorOff: Colors.black,
                  iconOn: Icons.close,
                  iconOff: Icons.square,
                  textSize: 18.0,
                  onChanged: (bool position){
                    isX = position;
                  },
                  onTap: (){},
                  onDoubleTap: (){},
                  onSwipe: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container borders(String number) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.tealAccent,
      ),
      child: Center(child: Text(number, style: const TextStyle(fontSize: 20),)),
    );
  }
}

