import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<GlobalKey<FlipCardState>> cardStateKeys = [
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
  ];

  int level = 8;

  List<bool> cardFlips = [true, true, true, true, true, true, true, true];
  List<String> data =['1', '1', '2', '2', '3', '3', '4', '4'];
  int previousIndex = -1;
  bool flip = false;
  bool start = false;
  bool wait = false;
  late int left;
  late bool isFinished;


  @override
  void initState(){
    super.initState();
    data.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('time', style: TextStyle(fontSize: 30),)
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context,index)=>FlipCard(
                      key: cardStateKeys[index],
                      onFlip: (){
                        if(!flip){
                          flip = true;
                          previousIndex = index;
                        }else{
                          flip = true;
                          if(previousIndex!=index){
                            wait = true;
                            if(data[previousIndex] != data[index]){
                              Future.delayed(
                                const Duration(milliseconds: 1500),(){
                                  cardStateKeys[previousIndex].currentState?.toggleCard();
                                  previousIndex = index;
                                  
                                  Future.delayed(
                                    const Duration(milliseconds: 160),(){
                                      setState(() {
                                        wait = false;
                                      });
                                  });
                              });
                            }else{
                              cardFlips[previousIndex] = false;
                              cardFlips[index] = false;
                              setState(() {
                                left -=1;
                              });
                              if(cardFlips.every((t) => t == false)){
                                print('win');
                                Future.delayed(
                                  const Duration(microseconds: 160), (){
                                    setState(() {
                                      isFinished = true;
                                      start = false;
                                    });
                                });
                              }
                            }
                          }
                        }
                      },
                      direction: FlipDirection.HORIZONTAL,
                      flipOnTouch: cardFlips[index],
                      front: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.deepOrange.withOpacity(0.3),
                      ),
                      back: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.deepOrange,
                        child: Center(
                          child: Text('${data[index]}', style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    ),
                    itemCount: data.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
