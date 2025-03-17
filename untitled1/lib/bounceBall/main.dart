import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'my_game.dart';

class bounceBallHomePage extends StatefulWidget {
  const bounceBallHomePage({super.key});

  @override
  State<bounceBallHomePage> createState() => _bounceBallHomePageState();
}

class _bounceBallHomePageState extends State<bounceBallHomePage> {
  late MyGame _myGame;

  @override
  void initState() {
    _myGame = MyGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget(game: _myGame),
            if (_myGame.isGamePlaying)
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _myGame.pauseGame();
                      });
                    },
                    icon: const Icon(Icons.pause),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: ValueListenableBuilder(
                  valueListenable: _myGame.currentScore,
                  builder: (context, int value, child) {
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            if (_myGame.isGamePaused)
              Container(
                color: Colors.black45,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'PAUSED!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _myGame.resumeGame();
                            });
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 140,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}