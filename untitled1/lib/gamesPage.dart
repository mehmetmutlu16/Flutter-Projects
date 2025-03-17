import 'package:flutter/material.dart';
import 'package:untitled1/blackjack/blackjack.dart';
import 'package:untitled1/bounceBall/main.dart';
import 'package:untitled1/cardMatchGame/cardMatchGame.dart';
import 'package:untitled1/flappyBird/main.dart';
import 'package:untitled1/hangman/hangman.dart';
import 'package:untitled1/pokeBomb/mainScreen.dart';
import 'package:untitled1/puzzleGame/puzzle3x3.dart';
import 'package:untitled1/tetris/tetris.dart';
import 'package:untitled1/wordle/wordle.dart';

class gamesPage extends StatefulWidget {
  const gamesPage({super.key});

  @override
  State<gamesPage> createState() => _gamesPageState();
}

class _gamesPageState extends State<gamesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text("Games"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: (){
                  if(index==0){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => puzzle3x3(imageChoose: 0)));
                  }else if(index==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => cardMatchGame()));
                  }else if(index == 2){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const mainScreen()));
                  }else if(index == 3){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const hangMan()));
                  }else if(index == 4){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const blackjack()));
                  }else if(index == 5){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const tetris()));
                  }else if(index == 6){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Wordle()));
                  }else if(index == 7){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const flappyStart()));
                  }else if(index == 8){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const bounceBallHomePage()));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.teal[100],
                  ),
                  child: Column(
                    children: [
                      Expanded(child: Image.asset('assets/00${index+1}.jpg', width: 150,)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
