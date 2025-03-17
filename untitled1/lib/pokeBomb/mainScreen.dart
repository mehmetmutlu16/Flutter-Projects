import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../changePage.dart';
import 'game.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  pokeBomb game = pokeBomb();

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
    game.resetGame();
    game.gameOver = false;
    startTimer();
    // TODO: implement initState
    super.initState();
    game.generateMap();
  }

  void _showSuccessDialog() {
    stopTimer();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal[100],
        title: const Text('Congrulations'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => changePage()),
                    (route) => false,
              );
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog() {
    stopTimer();
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          backgroundColor: Colors.teal[100],
          title: const Text('Game Over'),
          content: const Text('Play again'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  resetTimer();
                  game.resetGame();
                  game.gameOver = false;
                  Navigator.pop(context);
                });
              },
              child: const Text('Repeat'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Look mines'),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        elevation: 0.0,
        centerTitle: true,
        title: const Text('PokeBomb'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.flag,
                          color: Colors.green,
                          size: 34,
                        ),
                      ),
                      Expanded(
                        child: Text('Hold', style: TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Icon(
                          Icons.timer,
                          color: Colors.green,
                          size: 34,
                        ),
                      ),
                      Expanded(child: Text('$_counter Seconds', style: const TextStyle(color: Colors.white, fontSize: 14),)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 450,
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              itemCount: pokeBomb.cells,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: pokeBomb.row,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext ctx, index){
                return GestureDetector(
                  onTap: game.gameOver ? null : (){
                    setState(() {
                      game.getClickedCell(game.gameMap[index]);
                      if (game.gameOver) {
                        _showGameOverDialog();
                        stopTimer();
                      }
                      if(game.isGameFinished()){
                        _showSuccessDialog();
                      }
                    });
                  },
                  onLongPress: game.gameOver ? null : () {
                    setState(() {
                      game.toggleFlaggedCell(game.gameMap[index]);
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                    ),
                    child: Center(
                      child: Text(
                        game.gameMap[index].reveal
                            ? "${game.gameMap[index].content}"
                            : game.gameMap[index].flagged
                            ? "🚩" // bayrak ikonu
                            : "",
                        style: TextStyle(
                          color: game.gameMap[index].reveal
                              ? game.gameMap[index].content == "X"
                              ? Colors.pink
                              : Colors.white
                              : game.gameMap[index].flagged
                              ? Colors.green // bayrak rengi
                              : Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            game.gameOver
                ? "You Lost"
                : game.isGameFinished()
                ? "You Won"
                : "",
            style: const TextStyle(color: Colors.black),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: (){
                        setState(() {
                          resetTimer();
                          game.resetGame();
                          game.gameOver = false;
                        });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FaIcon(FontAwesomeIcons.repeat, color: Colors.white,),
                          Text('Repeat', style: TextStyle(color: Colors.white, fontSize: 15),),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: (){
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Main Menu', style: TextStyle(color: Colors.white, fontSize: 15),),
                          FaIcon(FontAwesomeIcons.rightToBracket, color: Colors.white,),
                        ],
                      ),
                    ),
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
