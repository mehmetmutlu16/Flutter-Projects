import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled1/changePage.dart';
import 'package:untitled1/hangman/widget/figure_image.dart';
import 'package:untitled1/hangman/widget/letter.dart';
import 'package:untitled1/homePage/pokemons.dart';

import 'game.dart';

class hangMan extends StatefulWidget {
  const hangMan({super.key});

  @override
  State<hangMan> createState() => _hangManState();
}

class _hangManState extends State<hangMan> {

  Random random = Random();

  late String word;
  late String resim;
  int x = 0;
  List<String> letters = [];
  late int randomNumber;

  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[100],
        title: const Text("You Lost"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                Game.selectedChar = [];
                Game.tries = 0;
              });
            },
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }

  gameWin() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[100],
        title: const Text("You Win"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                Game.selectedChar = [];
                Game.tries = 0;
              });
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const changePage()),
                    (route) => false,
              );
            },
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    randomNumber = random.nextInt(127);
    word = pokemonlar[randomNumber].name.toUpperCase();
    resim = pokemonlar[randomNumber].image;

    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (!letters.contains(letter)) {
        letters.add(letter);
      }
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hangman"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Image.asset(resim)),
              Center(
                child: Stack(
                  children: [
                    figureImage(Game.tries >= 0, "assets/hangman/hang.png"),
                    figureImage(Game.tries >= 1, "assets/hangman/head.png"),
                    figureImage(Game.tries >= 2, "assets/hangman/body.png"),
                    figureImage(Game.tries >= 3, "assets/hangman/ra.png"),
                    figureImage(Game.tries >= 4, "assets/hangman/la.png"),
                    figureImage(Game.tries >= 5, "assets/hangman/rl.png"),
                    figureImage(Game.tries >= 6, "assets/hangman/ll.png"),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
              .split('')
              .map((e) => letter(e.toUpperCase(),
                !Game.selectedChar.contains(e.toUpperCase())))
              .toList(),
          ),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: const EdgeInsets.all(8.0),
              children: alphabets.map((e){
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e)
                    ? null
                    : () {
                      setState(() {
                        Game.selectedChar.add(e);
                        if(word.split('').contains(e.toUpperCase())){
                          x++;
                          if(x==letters.length){
                            gameWin();
                            x=0;
                          }
                        }
                        if(!word.split('').contains(e.toUpperCase())){
                          Game.tries++;
                        }
                        if(Game.tries>=6){
                          showResult();
                        }
                      });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                    ? Colors.black38
                    : Colors.white,
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
