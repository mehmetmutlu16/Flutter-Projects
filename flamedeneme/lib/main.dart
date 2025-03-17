import 'package:flame/game.dart';
import 'package:flamedeneme/game/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SkiMasterApp());
}

class SkiMasterApp extends StatelessWidget {
  const SkiMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameWidget.controlled(gameFactory: SkiMasterGame.new),
    );
  }
}
